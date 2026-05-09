; DESCRIPTION: Renders a purple box of size 23x32 starting at (331, 127).
; PLAN: r0=331(x), r1=127(y), r2=23(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 127
LDI r2, 23
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
