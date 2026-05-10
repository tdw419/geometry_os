; DESCRIPTION: Creates a purple rectangular region at (188, 13) spanning 102 by 33 pixels.
; PLAN: r0=188(x), r1=13(y), r2=102(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 13
LDI r2, 102
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
