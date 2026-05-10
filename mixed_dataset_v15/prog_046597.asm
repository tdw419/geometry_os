; DESCRIPTION: Creates a purple rectangular region at (61, 144) spanning 67 by 60 pixels.
; PLAN: r0=61(x), r1=144(y), r2=67(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 144
LDI r2, 67
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
