; DESCRIPTION: Renders a white box of size 17x75 starting at (309, 79).
; PLAN: r0=309(x), r1=79(y), r2=17(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 79
LDI r2, 17
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
