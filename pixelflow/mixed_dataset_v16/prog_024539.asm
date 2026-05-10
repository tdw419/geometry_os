; DESCRIPTION: Renders a purple box of size 20x29 starting at (393, 184).
; PLAN: r0=393(x), r1=184(y), r2=20(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 184
LDI r2, 20
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
