; DESCRIPTION: Creates a blue rectangular region at (3, 44) spanning 90 by 119 pixels.
; PLAN: r0=3(x), r1=44(y), r2=90(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 44
LDI r2, 90
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
