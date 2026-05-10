; DESCRIPTION: Creates a green rectangular region at (119, 125) spanning 11 by 120 pixels.
; PLAN: r0=119(x), r1=125(y), r2=11(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 125
LDI r2, 11
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
