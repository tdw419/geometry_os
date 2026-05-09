; DESCRIPTION: Creates a green rectangular region at (282, 83) spanning 47 by 116 pixels.
; PLAN: r0=282(x), r1=83(y), r2=47(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 83
LDI r2, 47
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
