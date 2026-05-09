; DESCRIPTION: Renders a yellow box of size 78x78 starting at (105, 89).
; PLAN: r0=105(x), r1=89(y), r2=78(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 89
LDI r2, 78
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
