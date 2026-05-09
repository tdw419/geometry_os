; DESCRIPTION: Creates a white rectangular region at (216, 201) spanning 40 by 32 pixels.
; PLAN: r0=216(x), r1=201(y), r2=40(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 201
LDI r2, 40
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
