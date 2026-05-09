; DESCRIPTION: Renders a purple box of size 119x13 starting at (127, 83).
; PLAN: r0=127(x), r1=83(y), r2=119(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 83
LDI r2, 119
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
