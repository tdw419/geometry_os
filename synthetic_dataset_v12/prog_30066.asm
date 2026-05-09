; DESCRIPTION: Creates a green rectangular region at (20, 172) spanning 116 by 83 pixels.
; PLAN: r0=20(x), r1=172(y), r2=116(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 172
LDI r2, 116
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
