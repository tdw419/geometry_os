; DESCRIPTION: Creates a green rectangular region at (145, 95) spanning 35 by 73 pixels.
; PLAN: r0=145(x), r1=95(y), r2=35(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 95
LDI r2, 35
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
