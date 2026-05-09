; DESCRIPTION: Creates a purple rectangular region at (300, 106) spanning 115 by 19 pixels.
; PLAN: r0=300(x), r1=106(y), r2=115(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 106
LDI r2, 115
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
