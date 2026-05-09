; DESCRIPTION: Renders a purple box of size 49x18 starting at (120, 56).
; PLAN: r0=120(x), r1=56(y), r2=49(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 56
LDI r2, 49
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
