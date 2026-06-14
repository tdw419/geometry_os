#include "types.h"
#include "stat.h"
#include "fs.h"
#include "fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
    ;
  return os;
}

char*
strcat(char *s, const char *t)
{
  char *os = s;
  while (*s)
    s++;
  while ((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while (*p && *p == *q)
    p++, q++;
  return (unsigned char)*p - (unsigned char)*q;
}

int
strncmp(const char *p, const char *q, uint n)
{
  while (n > 0 && *p && *p == *q)
    n--, p++, q++;
  if (n == 0)
    return 0;
  return (unsigned char)*p - (unsigned char)*q;
}

char*
strncpy(char *s, const char *t, int n)
{
  char *os;

  os = s;
  while (n-- > 0 && (*s++ = *t++) != 0)
    ;
  while (n-- > 0)
    *s++ = 0;
  return os;
}

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  char *os;

  os = s;
  if (n <= 0)
    return os;
  while (--n > 0 && (*s++ = *t++) != 0)
    ;
  *s = 0;
  return os;
}

int
strlen(const char *s)
{
  int n;

  for (n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  char *cdst = (char *)dst;
  int i;
  for (i = 0; i < n; i++) {
    cdst[i] = c;
  }
  return dst;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    while (n-- > 0)
      *dst++ = *src++;
  } else {
    dst += n;
    src += n;
    while (n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}

void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
}

int
memcmp(const void *v1, const void *v2, uint n)
{
  const char *s1, *s2;

  s1 = v1;
  s2 = v2;
  while (n-- > 0) {
    if (*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }
  return 0;
}

int
atoi(const char *s)
{
  int n = 0;
  while ('0' <= *s && *s <= '9')
    n = n * 10 + (*s++ - '0');
  return n;
}

int
strchr(const char *s, char c)
{
  for (; *s; s++)
    if (*s == c)
      return 1;
  return 0;
}

// Read a line from fd 0 into buf. Stops at newline or nbuf-1 chars.
char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for (i = 0; i + 1 < max; ) {
    cc = read(0, &c, 1);
    if (cc < 1)
      break;
    buf[i++] = c;
    if (c == '\n')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if (fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}
