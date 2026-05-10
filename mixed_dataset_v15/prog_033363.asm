; DESCRIPTION: Creates a yellow filled rectangle of size 27x77 starting at (314, 1).
; PLAN: r0=314(x), r1=1(y), r2=27(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 1
LDI r2, 27
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
