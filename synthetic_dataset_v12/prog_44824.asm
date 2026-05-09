; DESCRIPTION: Creates a green rectangular region at (411, 162) spanning 33 by 31 pixels.
; PLAN: r0=411(x), r1=162(y), r2=33(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 162
LDI r2, 33
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
