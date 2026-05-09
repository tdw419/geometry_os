; DESCRIPTION: Creates a green rectangular region at (56, 124) spanning 21 by 43 pixels.
; PLAN: r0=56(x), r1=124(y), r2=21(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 124
LDI r2, 21
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
