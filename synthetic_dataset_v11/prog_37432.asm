; DESCRIPTION: Creates a purple rectangular region at (144, 115) spanning 80 by 33 pixels.
; PLAN: r0=144(x), r1=115(y), r2=80(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 115
LDI r2, 80
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
