; DESCRIPTION: Renders a purple box of size 17x75 starting at (162, 166).
; PLAN: r0=162(x), r1=166(y), r2=17(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 166
LDI r2, 17
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
