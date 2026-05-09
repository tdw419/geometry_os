; DESCRIPTION: Renders a purple box of size 17x102 starting at (8, 50).
; PLAN: r0=8(x), r1=50(y), r2=17(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 50
LDI r2, 17
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
