; DESCRIPTION: Creates a purple rectangular region at (44, 33) spanning 26 by 30 pixels.
; PLAN: r0=44(x), r1=33(y), r2=26(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 33
LDI r2, 26
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
