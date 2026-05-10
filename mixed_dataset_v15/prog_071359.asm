; DESCRIPTION: Creates a green rectangular region at (124, 45) spanning 63 by 90 pixels.
; PLAN: r0=124(x), r1=45(y), r2=63(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 45
LDI r2, 63
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
