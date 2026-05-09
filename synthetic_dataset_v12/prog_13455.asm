; DESCRIPTION: Creates a purple rectangular region at (128, 14) spanning 67 by 98 pixels.
; PLAN: r0=128(x), r1=14(y), r2=67(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 14
LDI r2, 67
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
