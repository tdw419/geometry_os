; DESCRIPTION: Creates a blue rectangular region at (178, 157) spanning 78 by 13 pixels.
; PLAN: r0=178(x), r1=157(y), r2=78(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 157
LDI r2, 78
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
