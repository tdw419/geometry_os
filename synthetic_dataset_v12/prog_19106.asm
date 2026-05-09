; DESCRIPTION: Creates a blue rectangular region at (475, 70) spanning 31 by 52 pixels.
; PLAN: r0=475(x), r1=70(y), r2=31(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 70
LDI r2, 31
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
