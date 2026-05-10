; DESCRIPTION: Creates a green rectangular region at (117, 167) spanning 78 by 55 pixels.
; PLAN: r0=117(x), r1=167(y), r2=78(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 167
LDI r2, 78
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
