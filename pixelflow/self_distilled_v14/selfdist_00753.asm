; DESCRIPTION: Creates a yellow filled rectangle of size 22x77 starting at (84, 18).
; PLAN: r0=84(x), r1=18(y), r2=22(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 18
LDI r2, 22
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
