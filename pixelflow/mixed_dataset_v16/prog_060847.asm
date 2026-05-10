; DESCRIPTION: Creates a purple rectangular region at (67, 3) spanning 58 by 103 pixels.
; PLAN: r0=67(x), r1=3(y), r2=58(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 3
LDI r2, 58
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
