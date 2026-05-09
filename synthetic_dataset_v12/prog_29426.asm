; DESCRIPTION: Renders a purple box of size 89x75 starting at (347, 160).
; PLAN: r0=347(x), r1=160(y), r2=89(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 160
LDI r2, 89
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
