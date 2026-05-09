; DESCRIPTION: Creates a blue rectangular region at (100, 12) spanning 44 by 35 pixels.
; PLAN: r0=100(x), r1=12(y), r2=44(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 12
LDI r2, 44
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
