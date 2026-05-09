; DESCRIPTION: Creates a purple rectangular region at (121, 39) spanning 19 by 75 pixels.
; PLAN: r0=121(x), r1=39(y), r2=19(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 39
LDI r2, 19
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
