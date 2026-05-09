; DESCRIPTION: Creates a blue rectangular region at (462, 157) spanning 43 by 23 pixels.
; PLAN: r0=462(x), r1=157(y), r2=43(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 157
LDI r2, 43
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
