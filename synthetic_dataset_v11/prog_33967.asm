; DESCRIPTION: Creates a purple rectangular region at (82, 23) spanning 20 by 110 pixels.
; PLAN: r0=82(x), r1=23(y), r2=20(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 23
LDI r2, 20
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
