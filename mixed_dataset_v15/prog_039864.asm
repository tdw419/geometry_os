; DESCRIPTION: Renders a purple box of size 99x18 starting at (309, 37).
; PLAN: r0=309(x), r1=37(y), r2=99(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 37
LDI r2, 99
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
