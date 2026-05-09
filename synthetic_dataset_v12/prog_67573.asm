; DESCRIPTION: Creates a purple rectangular region at (407, 58) spanning 54 by 90 pixels.
; PLAN: r0=407(x), r1=58(y), r2=54(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 58
LDI r2, 54
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
