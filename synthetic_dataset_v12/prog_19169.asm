; DESCRIPTION: Creates a purple rectangular region at (105, 117) spanning 85 by 75 pixels.
; PLAN: r0=105(x), r1=117(y), r2=85(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 117
LDI r2, 85
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
