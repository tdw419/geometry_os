; DESCRIPTION: Creates a green rectangular region at (248, 102) spanning 70 by 23 pixels.
; PLAN: r0=248(x), r1=102(y), r2=70(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 102
LDI r2, 70
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
