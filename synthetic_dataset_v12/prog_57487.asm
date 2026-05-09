; DESCRIPTION: Creates a blue rectangular region at (204, 9) spanning 34 by 38 pixels.
; PLAN: r0=204(x), r1=9(y), r2=34(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 9
LDI r2, 34
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
