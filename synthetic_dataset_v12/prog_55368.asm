; DESCRIPTION: Renders a purple box of size 23x61 starting at (347, 139).
; PLAN: r0=347(x), r1=139(y), r2=23(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 139
LDI r2, 23
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
