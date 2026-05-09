; DESCRIPTION: Creates a green rectangular region at (118, 34) spanning 37 by 30 pixels.
; PLAN: r0=118(x), r1=34(y), r2=37(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 34
LDI r2, 37
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
