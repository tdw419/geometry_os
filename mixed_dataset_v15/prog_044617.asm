; DESCRIPTION: Creates a blue rectangular region at (185, 159) spanning 80 by 80 pixels.
; PLAN: r0=185(x), r1=159(y), r2=80(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 159
LDI r2, 80
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
