; DESCRIPTION: Creates a green rectangular region at (244, 124) spanning 117 by 55 pixels.
; PLAN: r0=244(x), r1=124(y), r2=117(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 124
LDI r2, 117
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
