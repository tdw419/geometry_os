; DESCRIPTION: Creates a blue rectangular region at (123, 62) spanning 31 by 34 pixels.
; PLAN: r0=123(x), r1=62(y), r2=31(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 62
LDI r2, 31
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
