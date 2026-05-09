; DESCRIPTION: Creates a purple rectangular region at (386, 123) spanning 110 by 90 pixels.
; PLAN: r0=386(x), r1=123(y), r2=110(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 123
LDI r2, 110
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
