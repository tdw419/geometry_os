; DESCRIPTION: Renders a blue box of size 52x73 starting at (223, 7).
; PLAN: r0=223(x), r1=7(y), r2=52(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 7
LDI r2, 52
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
