; DESCRIPTION: Creates a purple rectangular region at (35, 75) spanning 91 by 58 pixels.
; PLAN: r0=35(x), r1=75(y), r2=91(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 75
LDI r2, 91
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
