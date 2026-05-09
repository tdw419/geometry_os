; DESCRIPTION: Creates a purple rectangular region at (101, 34) spanning 87 by 70 pixels.
; PLAN: r0=101(x), r1=34(y), r2=87(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 34
LDI r2, 87
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
