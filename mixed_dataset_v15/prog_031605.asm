; DESCRIPTION: Creates a blue rectangular region at (67, 87) spanning 15 by 61 pixels.
; PLAN: r0=67(x), r1=87(y), r2=15(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 87
LDI r2, 15
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
