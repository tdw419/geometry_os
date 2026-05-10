; DESCRIPTION: Renders a blue box of size 15x92 starting at (266, 33).
; PLAN: r0=266(x), r1=33(y), r2=15(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 33
LDI r2, 15
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
