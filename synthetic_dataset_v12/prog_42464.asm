; DESCRIPTION: Creates a green rectangular region at (250, 129) spanning 63 by 106 pixels.
; PLAN: r0=250(x), r1=129(y), r2=63(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 129
LDI r2, 63
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
