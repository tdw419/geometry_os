; DESCRIPTION: Creates a green rectangular region at (263, 99) spanning 38 by 21 pixels.
; PLAN: r0=263(x), r1=99(y), r2=38(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 99
LDI r2, 38
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
