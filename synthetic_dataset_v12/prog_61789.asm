; DESCRIPTION: Creates a blue rectangular region at (153, 97) spanning 60 by 72 pixels.
; PLAN: r0=153(x), r1=97(y), r2=60(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 97
LDI r2, 60
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
