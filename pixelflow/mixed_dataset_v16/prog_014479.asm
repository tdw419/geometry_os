; DESCRIPTION: Creates a purple rectangular region at (252, 125) spanning 44 by 100 pixels.
; PLAN: r0=252(x), r1=125(y), r2=44(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 125
LDI r2, 44
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
