; DESCRIPTION: Creates a purple rectangular region at (287, 87) spanning 38 by 75 pixels.
; PLAN: r0=287(x), r1=87(y), r2=38(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 87
LDI r2, 38
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
