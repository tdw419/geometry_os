; DESCRIPTION: Creates a green rectangular region at (334, 115) spanning 79 by 83 pixels.
; PLAN: r0=334(x), r1=115(y), r2=79(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 115
LDI r2, 79
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
