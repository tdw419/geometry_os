; DESCRIPTION: Creates a purple rectangular region at (13, 44) spanning 81 by 87 pixels.
; PLAN: r0=13(x), r1=44(y), r2=81(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 44
LDI r2, 81
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
