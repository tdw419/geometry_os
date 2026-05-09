; DESCRIPTION: Creates a green rectangular region at (65, 155) spanning 111 by 25 pixels.
; PLAN: r0=65(x), r1=155(y), r2=111(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 155
LDI r2, 111
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
