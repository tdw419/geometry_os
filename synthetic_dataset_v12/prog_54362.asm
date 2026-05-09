; DESCRIPTION: Creates a green rectangular region at (120, 90) spanning 110 by 102 pixels.
; PLAN: r0=120(x), r1=90(y), r2=110(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 90
LDI r2, 110
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
