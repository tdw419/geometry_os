; DESCRIPTION: Creates a purple rectangular region at (93, 1) spanning 113 by 97 pixels.
; PLAN: r0=93(x), r1=1(y), r2=113(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 1
LDI r2, 113
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
