// xv6 user-space function declarations.

struct stat;

// Type definitions
typedef unsigned int uint;

// va_list for printf
typedef __builtin_va_list va_list;
#define va_start(ap, last) __builtin_va_start(ap, last)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)

// system calls
int fork(void);
int exit(int) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, const void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(const char*, char**);
int open(const char*, int);
int mknod(const char*, short, short);
int unlink(const char*);
int fstat(int fd, struct stat*);
int link(const char*, const char*);
int mkdir(const char*);
int chdir(const char*);
int dup(int);
int getpid(void);
char* sbrk(int);
int sleep(int);
int pause(void);
int uptime(void);

// user library (ulib.c)
char* strcpy(char*, const char*);
char* strcat(char*, const char*);
int strcmp(const char*, const char*);
int strncmp(const char*, const char*, uint);
int strlen(const char*);
void* memset(void*, int, uint);
void* memmove(void*, const void*, int);
void* memcpy(void*, const void*, uint);
int memcmp(const void*, const void*, uint);
char* safestrcpy(char*, const char*, int);
int atoi(const char*);
int strchr(const char*, char);
char* gets(char*, int max);
int stat(const char*, struct stat*);

// printf.c
void printf(int, const char*, ...);
void fprintf(int, const char*, ...);
void vprintf(int, const char*, va_list);

// umalloc.c
void* malloc(uint);
void free(void*);
