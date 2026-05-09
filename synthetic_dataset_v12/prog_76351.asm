; DESCRIPTION: Creates a purple rectangular region at (58, 27) spanning 73 by 67 pixels.
; PLAN: r0=58(x), r1=27(y), r2=73(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 27
LDI r2, 73
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
