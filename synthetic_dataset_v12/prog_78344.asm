; DESCRIPTION: Creates a green rectangular region at (474, 97) spanning 24 by 16 pixels.
; PLAN: r0=474(x), r1=97(y), r2=24(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 97
LDI r2, 24
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
