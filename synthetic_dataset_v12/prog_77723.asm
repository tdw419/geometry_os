; DESCRIPTION: Creates a purple rectangular region at (187, 96) spanning 85 by 105 pixels.
; PLAN: r0=187(x), r1=96(y), r2=85(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 96
LDI r2, 85
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
