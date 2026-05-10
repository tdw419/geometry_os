; DESCRIPTION: Creates a yellow filled rectangle of size 46x96 starting at (15, 7).
; PLAN: r0=15(x), r1=7(y), r2=46(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 7
LDI r2, 46
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
