; DESCRIPTION: Creates a purple rectangular region at (75, 31) spanning 75 by 15 pixels.
; PLAN: r0=75(x), r1=31(y), r2=75(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 31
LDI r2, 75
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
