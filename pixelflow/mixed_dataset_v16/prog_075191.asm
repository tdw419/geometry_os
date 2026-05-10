; DESCRIPTION: Creates a purple rectangular region at (44, 126) spanning 14 by 104 pixels.
; PLAN: r0=44(x), r1=126(y), r2=14(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 126
LDI r2, 14
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
