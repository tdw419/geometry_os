; DESCRIPTION: Creates a green rectangular region at (289, 194) spanning 21 by 24 pixels.
; PLAN: r0=289(x), r1=194(y), r2=21(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 194
LDI r2, 21
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
