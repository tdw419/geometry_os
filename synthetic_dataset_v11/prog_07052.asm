; DESCRIPTION: Creates a blue rectangular region at (200, 40) spanning 11 by 98 pixels.
; PLAN: r0=200(x), r1=40(y), r2=11(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 40
LDI r2, 11
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
