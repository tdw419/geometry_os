; DESCRIPTION: Creates a blue rectangular region at (261, 53) spanning 87 by 13 pixels.
; PLAN: r0=261(x), r1=53(y), r2=87(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 53
LDI r2, 87
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
