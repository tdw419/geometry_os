; DESCRIPTION: Creates a purple rectangular region at (171, 144) spanning 57 by 106 pixels.
; PLAN: r0=171(x), r1=144(y), r2=57(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 144
LDI r2, 57
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
