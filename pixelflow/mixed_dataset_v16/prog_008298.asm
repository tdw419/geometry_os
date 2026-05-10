; DESCRIPTION: Creates a blue rectangular region at (420, 117) spanning 66 by 108 pixels.
; PLAN: r0=420(x), r1=117(y), r2=66(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 117
LDI r2, 66
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
