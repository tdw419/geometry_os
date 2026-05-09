; DESCRIPTION: Creates a green rectangular region at (223, 12) spanning 69 by 118 pixels.
; PLAN: r0=223(x), r1=12(y), r2=69(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 12
LDI r2, 69
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
