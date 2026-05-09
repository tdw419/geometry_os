; DESCRIPTION: Renders a green box of size 110x106 starting at (399, 92).
; PLAN: r0=399(x), r1=92(y), r2=110(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 92
LDI r2, 110
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
