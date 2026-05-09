; DESCRIPTION: Creates a blue rectangular region at (456, 44) spanning 33 by 115 pixels.
; PLAN: r0=456(x), r1=44(y), r2=33(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 44
LDI r2, 33
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
