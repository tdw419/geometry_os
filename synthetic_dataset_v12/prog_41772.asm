; DESCRIPTION: Creates a magenta rectangular region at (47, 162) spanning 25 by 14 pixels.
; PLAN: r0=47(x), r1=162(y), r2=25(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 162
LDI r2, 25
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
