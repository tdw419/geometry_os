; DESCRIPTION: Creates a green rectangular region at (16, 115) spanning 69 by 21 pixels.
; PLAN: r0=16(x), r1=115(y), r2=69(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 115
LDI r2, 69
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
