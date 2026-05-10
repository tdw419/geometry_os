; DESCRIPTION: Renders a purple box of size 12x75 starting at (444, 23).
; PLAN: r0=444(x), r1=23(y), r2=12(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 23
LDI r2, 12
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
