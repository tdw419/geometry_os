; DESCRIPTION: Creates a purple rectangular region at (208, 162) spanning 40 by 34 pixels.
; PLAN: r0=208(x), r1=162(y), r2=40(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 162
LDI r2, 40
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
