; DESCRIPTION: Renders a purple box of size 92x54 starting at (130, 122).
; PLAN: r0=130(x), r1=122(y), r2=92(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 122
LDI r2, 92
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
