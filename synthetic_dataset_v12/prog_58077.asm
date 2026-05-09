; DESCRIPTION: Creates a green rectangular region at (139, 79) spanning 72 by 63 pixels.
; PLAN: r0=139(x), r1=79(y), r2=72(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 79
LDI r2, 72
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
