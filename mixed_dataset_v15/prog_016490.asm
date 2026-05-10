; DESCRIPTION: Creates a green rectangular region at (320, 72) spanning 43 by 30 pixels.
; PLAN: r0=320(x), r1=72(y), r2=43(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 72
LDI r2, 43
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
