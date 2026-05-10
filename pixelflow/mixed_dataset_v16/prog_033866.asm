; DESCRIPTION: Renders a purple box of size 36x15 starting at (119, 37).
; PLAN: r0=119(x), r1=37(y), r2=36(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 37
LDI r2, 36
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
