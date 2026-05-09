; DESCRIPTION: Renders a blue box of size 31x59 starting at (27, 77).
; PLAN: r0=27(x), r1=77(y), r2=31(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 31
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
