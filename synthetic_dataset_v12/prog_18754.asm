; DESCRIPTION: Renders a purple box of size 17x55 starting at (372, 185).
; PLAN: r0=372(x), r1=185(y), r2=17(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 185
LDI r2, 17
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
