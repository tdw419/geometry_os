; DESCRIPTION: Creates a purple rectangular region at (21, 23) spanning 80 by 101 pixels.
; PLAN: r0=21(x), r1=23(y), r2=80(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 23
LDI r2, 80
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
