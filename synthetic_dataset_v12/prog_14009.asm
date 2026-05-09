; DESCRIPTION: Creates a purple rectangular region at (34, 161) spanning 75 by 24 pixels.
; PLAN: r0=34(x), r1=161(y), r2=75(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 161
LDI r2, 75
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
