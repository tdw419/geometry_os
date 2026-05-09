; DESCRIPTION: Creates a green rectangular region at (188, 140) spanning 55 by 36 pixels.
; PLAN: r0=188(x), r1=140(y), r2=55(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 140
LDI r2, 55
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
