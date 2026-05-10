; DESCRIPTION: Creates a blue rectangular region at (273, 124) spanning 53 by 22 pixels.
; PLAN: r0=273(x), r1=124(y), r2=53(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 124
LDI r2, 53
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
