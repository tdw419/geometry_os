; DESCRIPTION: Creates a green rectangular region at (176, 62) spanning 52 by 72 pixels.
; PLAN: r0=176(x), r1=62(y), r2=52(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 62
LDI r2, 52
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
