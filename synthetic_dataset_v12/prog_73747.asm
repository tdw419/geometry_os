; DESCRIPTION: Creates a blue rectangular region at (198, 172) spanning 97 by 53 pixels.
; PLAN: r0=198(x), r1=172(y), r2=97(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 172
LDI r2, 97
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
