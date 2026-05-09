; DESCRIPTION: Creates a purple rectangular region at (25, 133) spanning 80 by 20 pixels.
; PLAN: r0=25(x), r1=133(y), r2=80(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 133
LDI r2, 80
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
