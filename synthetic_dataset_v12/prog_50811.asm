; DESCRIPTION: Creates a purple rectangular region at (456, 217) spanning 14 by 37 pixels.
; PLAN: r0=456(x), r1=217(y), r2=14(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 217
LDI r2, 14
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
