; DESCRIPTION: Renders a purple box of size 37x29 starting at (136, 223).
; PLAN: r0=136(x), r1=223(y), r2=37(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 223
LDI r2, 37
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
