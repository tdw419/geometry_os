; DESCRIPTION: Creates a purple rectangular region at (144, 140) spanning 79 by 60 pixels.
; PLAN: r0=144(x), r1=140(y), r2=79(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 140
LDI r2, 79
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
