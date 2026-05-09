; DESCRIPTION: Creates a purple rectangular region at (126, 34) spanning 104 by 57 pixels.
; PLAN: r0=126(x), r1=34(y), r2=104(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 34
LDI r2, 104
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
