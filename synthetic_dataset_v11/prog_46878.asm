; DESCRIPTION: Creates a green rectangular region at (107, 18) spanning 85 by 118 pixels.
; PLAN: r0=107(x), r1=18(y), r2=85(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 18
LDI r2, 85
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
