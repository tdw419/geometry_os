; DESCRIPTION: Creates a purple rectangular region at (19, 38) spanning 120 by 20 pixels.
; PLAN: r0=19(x), r1=38(y), r2=120(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 38
LDI r2, 120
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
