; DESCRIPTION: Creates a blue rectangular region at (114, 131) spanning 119 by 80 pixels.
; PLAN: r0=114(x), r1=131(y), r2=119(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 131
LDI r2, 119
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
