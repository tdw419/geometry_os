; DESCRIPTION: Creates a purple rectangular region at (93, 84) spanning 75 by 30 pixels.
; PLAN: r0=93(x), r1=84(y), r2=75(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 84
LDI r2, 75
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
