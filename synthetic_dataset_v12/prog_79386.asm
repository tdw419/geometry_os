; DESCRIPTION: Creates a green rectangular region at (239, 6) spanning 116 by 80 pixels.
; PLAN: r0=239(x), r1=6(y), r2=116(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 6
LDI r2, 116
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
