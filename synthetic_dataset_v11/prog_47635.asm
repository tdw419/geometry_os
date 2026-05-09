; DESCRIPTION: Renders a purple box of size 83x28 starting at (55, 155).
; PLAN: r0=55(x), r1=155(y), r2=83(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 155
LDI r2, 83
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
