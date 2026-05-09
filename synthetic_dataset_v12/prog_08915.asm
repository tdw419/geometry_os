; DESCRIPTION: Creates a blue rectangular region at (324, 80) spanning 118 by 44 pixels.
; PLAN: r0=324(x), r1=80(y), r2=118(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 80
LDI r2, 118
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
