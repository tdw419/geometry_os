; DESCRIPTION: Creates a green rectangular region at (57, 167) spanning 35 by 80 pixels.
; PLAN: r0=57(x), r1=167(y), r2=35(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 167
LDI r2, 35
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
