; DESCRIPTION: Places a green 46x99 rectangle at position (431, 116).
; PLAN: r0=431(x), r1=116(y), r2=46(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 116
LDI r2, 46
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
