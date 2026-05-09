; DESCRIPTION: Creates a blue rectangular region at (3, 38) spanning 22 by 21 pixels.
; PLAN: r0=3(x), r1=38(y), r2=22(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 38
LDI r2, 22
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
