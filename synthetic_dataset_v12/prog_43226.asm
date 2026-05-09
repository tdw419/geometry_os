; DESCRIPTION: Creates a green rectangular region at (332, 184) spanning 86 by 38 pixels.
; PLAN: r0=332(x), r1=184(y), r2=86(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 184
LDI r2, 86
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
