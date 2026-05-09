; DESCRIPTION: Creates a green rectangular region at (373, 136) spanning 116 by 105 pixels.
; PLAN: r0=373(x), r1=136(y), r2=116(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 136
LDI r2, 116
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
