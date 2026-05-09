; DESCRIPTION: Creates a green rectangular region at (157, 191) spanning 78 by 63 pixels.
; PLAN: r0=157(x), r1=191(y), r2=78(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 191
LDI r2, 78
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
