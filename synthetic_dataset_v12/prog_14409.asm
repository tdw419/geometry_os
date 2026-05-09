; DESCRIPTION: Creates a blue rectangular region at (381, 122) spanning 61 by 45 pixels.
; PLAN: r0=381(x), r1=122(y), r2=61(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 122
LDI r2, 61
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
