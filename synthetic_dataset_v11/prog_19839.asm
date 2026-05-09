; DESCRIPTION: Creates a green rectangular region at (139, 139) spanning 91 by 60 pixels.
; PLAN: r0=139(x), r1=139(y), r2=91(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 139
LDI r2, 91
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
