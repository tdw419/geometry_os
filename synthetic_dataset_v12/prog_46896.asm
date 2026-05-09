; DESCRIPTION: Creates a green rectangular region at (424, 16) spanning 21 by 38 pixels.
; PLAN: r0=424(x), r1=16(y), r2=21(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 16
LDI r2, 21
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
