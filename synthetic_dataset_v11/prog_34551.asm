; DESCRIPTION: Renders a white box of size 85x70 starting at (156, 35).
; PLAN: r0=156(x), r1=35(y), r2=85(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 35
LDI r2, 85
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
