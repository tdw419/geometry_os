; DESCRIPTION: Creates a purple rectangular region at (127, 137) spanning 78 by 75 pixels.
; PLAN: r0=127(x), r1=137(y), r2=78(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 137
LDI r2, 78
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
