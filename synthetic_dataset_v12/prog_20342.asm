; DESCRIPTION: Creates a purple rectangular region at (188, 95) spanning 117 by 66 pixels.
; PLAN: r0=188(x), r1=95(y), r2=117(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 95
LDI r2, 117
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
