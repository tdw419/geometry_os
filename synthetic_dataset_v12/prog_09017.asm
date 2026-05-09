; DESCRIPTION: Renders a purple box of size 50x100 starting at (347, 17).
; PLAN: r0=347(x), r1=17(y), r2=50(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 17
LDI r2, 50
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
