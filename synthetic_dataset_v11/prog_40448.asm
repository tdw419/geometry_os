; DESCRIPTION: Creates a green rectangular region at (133, 70) spanning 33 by 53 pixels.
; PLAN: r0=133(x), r1=70(y), r2=33(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 70
LDI r2, 33
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
