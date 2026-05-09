; DESCRIPTION: Creates a purple rectangular region at (10, 150) spanning 110 by 85 pixels.
; PLAN: r0=10(x), r1=150(y), r2=110(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 150
LDI r2, 110
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
