; DESCRIPTION: Creates a purple rectangular region at (75, 8) spanning 106 by 113 pixels.
; PLAN: r0=75(x), r1=8(y), r2=106(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 8
LDI r2, 106
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
