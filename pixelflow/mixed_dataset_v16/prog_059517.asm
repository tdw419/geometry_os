; DESCRIPTION: Creates a blue rectangular region at (406, 134) spanning 34 by 80 pixels.
; PLAN: r0=406(x), r1=134(y), r2=34(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 134
LDI r2, 34
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
