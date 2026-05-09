; DESCRIPTION: Creates a yellow rectangular region at (200, 79) spanning 35 by 115 pixels.
; PLAN: r0=200(x), r1=79(y), r2=35(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 79
LDI r2, 35
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
