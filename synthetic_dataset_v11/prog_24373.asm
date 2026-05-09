; DESCRIPTION: Creates a green rectangular region at (44, 123) spanning 82 by 78 pixels.
; PLAN: r0=44(x), r1=123(y), r2=82(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 123
LDI r2, 82
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
