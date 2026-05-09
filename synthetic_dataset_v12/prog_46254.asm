; DESCRIPTION: Renders a purple box of size 93x50 starting at (278, 17).
; PLAN: r0=278(x), r1=17(y), r2=93(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 17
LDI r2, 93
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
