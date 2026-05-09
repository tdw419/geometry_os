; DESCRIPTION: Creates a purple rectangular region at (58, 115) spanning 26 by 91 pixels.
; PLAN: r0=58(x), r1=115(y), r2=26(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 115
LDI r2, 26
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
