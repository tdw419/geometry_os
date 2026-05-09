; DESCRIPTION: Creates a green rectangular region at (181, 48) spanning 117 by 63 pixels.
; PLAN: r0=181(x), r1=48(y), r2=117(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 48
LDI r2, 117
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
