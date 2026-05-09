; DESCRIPTION: Creates a white rectangular region at (201, 101) spanning 69 by 75 pixels.
; PLAN: r0=201(x), r1=101(y), r2=69(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 101
LDI r2, 69
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
