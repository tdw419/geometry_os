; DESCRIPTION: Creates a purple rectangular region at (433, 75) spanning 15 by 116 pixels.
; PLAN: r0=433(x), r1=75(y), r2=15(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 75
LDI r2, 15
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
