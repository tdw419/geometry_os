; DESCRIPTION: Creates a purple rectangular region at (5, 214) spanning 85 by 20 pixels.
; PLAN: r0=5(x), r1=214(y), r2=85(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 214
LDI r2, 85
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
