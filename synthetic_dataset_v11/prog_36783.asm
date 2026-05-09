; DESCRIPTION: Creates a blue rectangular region at (137, 178) spanning 89 by 54 pixels.
; PLAN: r0=137(x), r1=178(y), r2=89(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 178
LDI r2, 89
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
