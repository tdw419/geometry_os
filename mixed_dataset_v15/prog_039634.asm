; DESCRIPTION: Creates a blue rectangular region at (406, 47) spanning 21 by 22 pixels.
; PLAN: r0=406(x), r1=47(y), r2=21(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 47
LDI r2, 21
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
