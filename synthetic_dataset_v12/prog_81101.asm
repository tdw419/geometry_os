; DESCRIPTION: Creates a green rectangular region at (338, 23) spanning 24 by 62 pixels.
; PLAN: r0=338(x), r1=23(y), r2=24(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 23
LDI r2, 24
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
