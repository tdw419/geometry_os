; DESCRIPTION: Creates a purple rectangular region at (36, 65) spanning 113 by 118 pixels.
; PLAN: r0=36(x), r1=65(y), r2=113(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 65
LDI r2, 113
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
