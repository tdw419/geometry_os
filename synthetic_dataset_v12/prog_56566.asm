; DESCRIPTION: Creates a green rectangular region at (456, 176) spanning 33 by 19 pixels.
; PLAN: r0=456(x), r1=176(y), r2=33(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 176
LDI r2, 33
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
