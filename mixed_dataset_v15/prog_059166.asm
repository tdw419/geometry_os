; DESCRIPTION: Renders a purple box of size 49x52 starting at (113, 24).
; PLAN: r0=113(x), r1=24(y), r2=49(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 24
LDI r2, 49
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
