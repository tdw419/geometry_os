; DESCRIPTION: Creates a purple rectangular region at (149, 166) spanning 13 by 35 pixels.
; PLAN: r0=149(x), r1=166(y), r2=13(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 166
LDI r2, 13
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
