; DESCRIPTION: Creates a purple rectangular region at (121, 47) spanning 79 by 97 pixels.
; PLAN: r0=121(x), r1=47(y), r2=79(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 47
LDI r2, 79
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
