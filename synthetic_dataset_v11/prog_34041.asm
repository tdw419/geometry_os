; DESCRIPTION: Creates a green rectangular region at (204, 13) spanning 45 by 63 pixels.
; PLAN: r0=204(x), r1=13(y), r2=45(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 13
LDI r2, 45
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
