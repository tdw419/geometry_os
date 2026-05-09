; DESCRIPTION: Creates a green rectangular region at (76, 141) spanning 58 by 33 pixels.
; PLAN: r0=76(x), r1=141(y), r2=58(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 141
LDI r2, 58
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
