; DESCRIPTION: Renders a purple box of size 23x26 starting at (43, 220).
; PLAN: r0=43(x), r1=220(y), r2=23(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 220
LDI r2, 23
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
