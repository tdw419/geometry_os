; DESCRIPTION: Creates a purple rectangular region at (58, 57) spanning 53 by 13 pixels.
; PLAN: r0=58(x), r1=57(y), r2=53(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 57
LDI r2, 53
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
