; DESCRIPTION: Renders a purple box of size 23x29 starting at (232, 50).
; PLAN: r0=232(x), r1=50(y), r2=23(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 50
LDI r2, 23
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
