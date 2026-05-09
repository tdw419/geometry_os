; DESCRIPTION: Creates a purple rectangular region at (162, 96) spanning 18 by 54 pixels.
; PLAN: r0=162(x), r1=96(y), r2=18(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 18
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
