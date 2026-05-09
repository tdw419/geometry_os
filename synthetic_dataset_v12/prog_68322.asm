; DESCRIPTION: Creates a purple rectangular region at (162, 77) spanning 40 by 109 pixels.
; PLAN: r0=162(x), r1=77(y), r2=40(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 77
LDI r2, 40
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
