; DESCRIPTION: Creates a blue rectangular region at (196, 101) spanning 67 by 15 pixels.
; PLAN: r0=196(x), r1=101(y), r2=67(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 101
LDI r2, 67
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
