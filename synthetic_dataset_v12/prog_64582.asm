; DESCRIPTION: Creates a green rectangular region at (206, 21) spanning 83 by 119 pixels.
; PLAN: r0=206(x), r1=21(y), r2=83(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 21
LDI r2, 83
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
