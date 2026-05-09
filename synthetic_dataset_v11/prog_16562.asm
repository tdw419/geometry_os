; DESCRIPTION: Creates a green rectangular region at (153, 78) spanning 68 by 24 pixels.
; PLAN: r0=153(x), r1=78(y), r2=68(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 78
LDI r2, 68
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
