// tinycalc.c -- A small C expression calculator for xv6
// Evaluates arithmetic expressions with + - * / ( ) and integer variables.
// Usage: tinycalc             (interactive REPL)
//        tinycalc file.calc   (run script from file)
//
// Grammar:
//   program  := statement*
//   statement:= expr ';' | 'print' expr ';' | 'int' IDENT ';' | IDENT '=' expr ';'
//   expr     := term (('+'|'-') term)*
//   term     := factor (('*'|'/') factor)*
//   factor   := NUMBER | IDENT | '(' expr ')' | '-' factor

#include "types.h"
#include "stat.h"
#include "user/user.h"
#include "fcntl.h"

#define MAX_LINE 256
#define MAX_VARS 64
#define MAX_PROG 4096

struct Var {
    char name[16];
    int val;
};

struct Var vars[MAX_VARS];
int nvars = 0;
char *src;       // current parse position
char line[MAX_LINE];
int line_num;

int get_var_val(const char *name) {
    for (int i = 0; i < nvars; i++)
        if (strcmp(vars[i].name, name) == 0)
            return vars[i].val;
    return 0;
}

void set_var(const char *name, int val) {
    for (int i = 0; i < nvars; i++)
        if (strcmp(vars[i].name, name) == 0) {
            vars[i].val = val;
            return;
        }
    if (nvars < MAX_VARS) {
        safestrcpy(vars[nvars].name, name, 16);
        vars[nvars].val = val;
        nvars++;
    }
}

void skip_ws(void) {
    while (*src == ' ' || *src == '\t' || *src == '\n') src++;
}

int is_ident_start(char c) {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_';
}

int is_ident_cont(char c) {
    return is_ident_start(c) || (c >= '0' && c <= '9');
}

void parse_ident(char *buf, int max) {
    int i = 0;
    while (is_ident_cont(*src) && i < max - 1)
        buf[i++] = *src++;
    buf[i] = 0;
}

// Forward declaration
int parse_expr(void);

// factor := NUMBER | IDENT | '(' expr ')' | '-' factor
int parse_factor(void) {
    skip_ws();
    if (*src == '(') {
        src++;
        int v = parse_expr();
        skip_ws();
        if (*src == ')') src++;
        return v;
    }
    if (*src == '-') {
        src++;
        return -parse_factor();
    }
    if (*src >= '0' && *src <= '9') {
        int v = 0;
        while (*src >= '0' && *src <= '9')
            v = v * 10 + (*src++ - '0');
        return v;
    }
    if (is_ident_start(*src)) {
        char name[16];
        parse_ident(name, 16);
        return get_var_val(name);
    }
    printf(2, "line %d: unexpected '%c'\n", line_num, *src ? *src : 'E');
    return 0;
}

// term := factor (('*'|'/') factor)*
int parse_term(void) {
    int v = parse_factor();
    while (1) {
        skip_ws();
        if (*src == '*') { src++; v *= parse_factor(); }
        else if (*src == '/') { src++; int d = parse_factor(); if (d) v /= d; }
        else break;
    }
    return v;
}

// expr := term (('+'|'-') term)*
int parse_expr(void) {
    int v = parse_term();
    while (1) {
        skip_ws();
        if (*src == '+') { src++; v += parse_term(); }
        else if (*src == '-') { src++; v -= parse_term(); }
        else break;
    }
    return v;
}

// Parse one statement
int parse_statement(void) {
    skip_ws();
    if (*src == 0 || *src == ';') return 0; // empty or end

    // 'print' expr ';'
    if (strncmp(src, "print", 5) == 0 && !is_ident_cont(src[5])) {
        src += 5;
        int v = parse_expr();
        skip_ws();
        if (*src == ';') src++;
        printf(1, "%d\n", v);
        return 1;
    }

    // 'int' IDENT ';'
    if (strncmp(src, "int", 3) == 0 && !is_ident_cont(src[3])) {
        src += 3;
        skip_ws();
        char name[16];
        parse_ident(name, 16);
        set_var(name, 0);
        skip_ws();
        if (*src == ';') src++;
        return 1;
    }

    // IDENT '=' expr ';'  or  expr ';'
    if (is_ident_start(*src)) {
        // Peek ahead for '='
        char *save = src;
        char name[16];
        parse_ident(name, 16);
        skip_ws();
        if (*src == '=') {
            src++; // skip '='
            int v = parse_expr();
            set_var(name, v);
            skip_ws();
            if (*src == ';') src++;
            return 1;
        }
        // Not an assignment — back up and treat as expression
        src = save;
    }

    // expression statement
    int v = parse_expr();
    skip_ws();
    if (*src == ';') src++;
    printf(1, "%d\n", v);
    return 1;
}

void run_program(char *prog) {
    src = prog;
    line_num = 1;
    while (*src) {
        skip_ws();
        if (*src == 0) break;
        parse_statement();
    }
}

int main(int argc, char *argv[]) {
    if (argc == 1) {
        // Interactive REPL
        printf(1, "tinycalc v0.1 — expressions, int, print\n");
        while (1) {
            printf(1, "> ");
            memset(line, 0, sizeof(line));
            if (gets(line, sizeof(line)) == 0 || line[0] == 0)
                break;
            run_program(line);
        }
    } else {
        // Run file
        int fd = open(argv[1], O_RDONLY);
        if (fd < 0) {
            printf(2, "tinycalc: cannot open %s\n", argv[1]);
            exit(1);
        }
        char prog[MAX_PROG];
        int n = read(fd, prog, MAX_PROG - 1);
        close(fd);
        if (n <= 0) exit(0);
        prog[n] = 0;
        run_program(prog);
    }
    exit(0);
}
