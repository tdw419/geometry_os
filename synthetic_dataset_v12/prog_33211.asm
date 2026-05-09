; DESCRIPTION: Renders a white box of size 15x65 starting at (137, 122).
; PLAN: r0=137(x), r1=122(y), r2=15(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 122
LDI r2, 15
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
