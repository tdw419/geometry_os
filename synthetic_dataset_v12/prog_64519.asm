; DESCRIPTION: Creates a red rectangular region at (119, 65) spanning 37 by 110 pixels.
; PLAN: r0=119(x), r1=65(y), r2=37(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 65
LDI r2, 37
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
