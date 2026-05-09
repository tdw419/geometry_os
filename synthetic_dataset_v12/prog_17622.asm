; DESCRIPTION: Creates a green rectangular region at (447, 121) spanning 33 by 106 pixels.
; PLAN: r0=447(x), r1=121(y), r2=33(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 121
LDI r2, 33
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
