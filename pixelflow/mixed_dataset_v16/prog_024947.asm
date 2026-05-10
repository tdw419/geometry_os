; DESCRIPTION: Creates a purple rectangular region at (389, 38) spanning 34 by 120 pixels.
; PLAN: r0=389(x), r1=38(y), r2=34(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 38
LDI r2, 34
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
