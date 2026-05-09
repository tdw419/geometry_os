; DESCRIPTION: Creates a blue rectangular region at (222, 67) spanning 23 by 105 pixels.
; PLAN: r0=222(x), r1=67(y), r2=23(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 67
LDI r2, 23
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
