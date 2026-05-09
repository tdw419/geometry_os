; DESCRIPTION: Renders a purple box of size 91x49 starting at (302, 188).
; PLAN: r0=302(x), r1=188(y), r2=91(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 188
LDI r2, 91
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
