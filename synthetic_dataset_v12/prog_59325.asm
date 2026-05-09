; DESCRIPTION: Creates a green rectangular region at (250, 123) spanning 109 by 53 pixels.
; PLAN: r0=250(x), r1=123(y), r2=109(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 123
LDI r2, 109
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
