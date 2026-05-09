; DESCRIPTION: Creates a purple rectangular region at (26, 4) spanning 90 by 20 pixels.
; PLAN: r0=26(x), r1=4(y), r2=90(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 4
LDI r2, 90
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
