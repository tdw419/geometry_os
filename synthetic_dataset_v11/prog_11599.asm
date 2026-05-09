; DESCRIPTION: Creates a green rectangular region at (218, 88) spanning 11 by 71 pixels.
; PLAN: r0=218(x), r1=88(y), r2=11(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 88
LDI r2, 11
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
