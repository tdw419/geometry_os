; DESCRIPTION: Creates a purple rectangular region at (313, 71) spanning 74 by 66 pixels.
; PLAN: r0=313(x), r1=71(y), r2=74(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 71
LDI r2, 74
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
