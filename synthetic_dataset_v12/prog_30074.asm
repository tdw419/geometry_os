; DESCRIPTION: Creates a blue rectangular region at (2, 1) spanning 44 by 108 pixels.
; PLAN: r0=2(x), r1=1(y), r2=44(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 1
LDI r2, 44
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
