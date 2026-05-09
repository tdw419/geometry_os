; DESCRIPTION: Creates a white rectangular region at (0, 201) spanning 58 by 35 pixels.
; PLAN: r0=0(x), r1=201(y), r2=58(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 201
LDI r2, 58
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
