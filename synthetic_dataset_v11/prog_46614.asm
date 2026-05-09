; DESCRIPTION: Creates a blue rectangular region at (67, 188) spanning 117 by 13 pixels.
; PLAN: r0=67(x), r1=188(y), r2=117(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 188
LDI r2, 117
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
