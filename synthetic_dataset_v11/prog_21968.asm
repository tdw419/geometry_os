; DESCRIPTION: Creates a purple rectangular region at (161, 26) spanning 14 by 21 pixels.
; PLAN: r0=161(x), r1=26(y), r2=14(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 26
LDI r2, 14
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
