; DESCRIPTION: Creates a green rectangular region at (347, 56) spanning 95 by 16 pixels.
; PLAN: r0=347(x), r1=56(y), r2=95(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 56
LDI r2, 95
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
