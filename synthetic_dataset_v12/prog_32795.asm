; DESCRIPTION: Creates a green rectangular region at (258, 3) spanning 60 by 54 pixels.
; PLAN: r0=258(x), r1=3(y), r2=60(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 3
LDI r2, 60
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
