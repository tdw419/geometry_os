; DESCRIPTION: Creates a green rectangular region at (375, 115) spanning 45 by 19 pixels.
; PLAN: r0=375(x), r1=115(y), r2=45(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 115
LDI r2, 45
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
