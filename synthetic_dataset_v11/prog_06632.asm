; DESCRIPTION: Creates a purple rectangular region at (44, 117) spanning 22 by 98 pixels.
; PLAN: r0=44(x), r1=117(y), r2=22(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 117
LDI r2, 22
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
