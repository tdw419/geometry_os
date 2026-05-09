; DESCRIPTION: Creates a green rectangular region at (171, 115) spanning 52 by 104 pixels.
; PLAN: r0=171(x), r1=115(y), r2=52(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 115
LDI r2, 52
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
