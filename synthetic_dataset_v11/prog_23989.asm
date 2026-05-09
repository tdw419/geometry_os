; DESCRIPTION: Creates a purple rectangular region at (24, 67) spanning 104 by 92 pixels.
; PLAN: r0=24(x), r1=67(y), r2=104(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 67
LDI r2, 104
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
