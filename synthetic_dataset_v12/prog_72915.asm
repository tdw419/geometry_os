; DESCRIPTION: Renders a white box of size 70x110 starting at (109, 97).
; PLAN: r0=109(x), r1=97(y), r2=70(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 97
LDI r2, 70
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
