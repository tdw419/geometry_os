; DESCRIPTION: Creates a blue rectangular region at (69, 77) spanning 108 by 13 pixels.
; PLAN: r0=69(x), r1=77(y), r2=108(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 77
LDI r2, 108
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
