; DESCRIPTION: Creates a purple rectangular region at (33, 58) spanning 67 by 105 pixels.
; PLAN: r0=33(x), r1=58(y), r2=67(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 58
LDI r2, 67
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
