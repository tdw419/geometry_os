; DESCRIPTION: Renders a purple box of size 62x19 starting at (347, 16).
; PLAN: r0=347(x), r1=16(y), r2=62(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 16
LDI r2, 62
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
