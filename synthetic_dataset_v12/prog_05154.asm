; DESCRIPTION: Renders a white box of size 70x65 starting at (12, 145).
; PLAN: r0=12(x), r1=145(y), r2=70(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 145
LDI r2, 70
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
