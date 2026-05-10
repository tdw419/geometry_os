; DESCRIPTION: Creates a purple rectangular region at (236, 90) spanning 18 by 60 pixels.
; PLAN: r0=236(x), r1=90(y), r2=18(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 90
LDI r2, 18
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
