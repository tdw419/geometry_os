; DESCRIPTION: Creates a purple rectangular region at (164, 217) spanning 50 by 13 pixels.
; PLAN: r0=164(x), r1=217(y), r2=50(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 217
LDI r2, 50
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
