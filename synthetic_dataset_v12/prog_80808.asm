; DESCRIPTION: Creates a blue rectangular region at (403, 110) spanning 109 by 62 pixels.
; PLAN: r0=403(x), r1=110(y), r2=109(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 110
LDI r2, 109
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
