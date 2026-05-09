; DESCRIPTION: Creates a green rectangular region at (136, 125) spanning 111 by 26 pixels.
; PLAN: r0=136(x), r1=125(y), r2=111(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 111
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
