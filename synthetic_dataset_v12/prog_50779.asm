; DESCRIPTION: Creates a purple rectangular region at (106, 75) spanning 61 by 36 pixels.
; PLAN: r0=106(x), r1=75(y), r2=61(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 75
LDI r2, 61
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
