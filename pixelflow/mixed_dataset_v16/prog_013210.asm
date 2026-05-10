; DESCRIPTION: Creates a green rectangular region at (289, 161) spanning 14 by 44 pixels.
; PLAN: r0=289(x), r1=161(y), r2=14(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 161
LDI r2, 14
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
