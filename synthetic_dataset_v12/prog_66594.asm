; DESCRIPTION: Creates a purple rectangular region at (79, 9) spanning 70 by 53 pixels.
; PLAN: r0=79(x), r1=9(y), r2=70(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 9
LDI r2, 70
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
