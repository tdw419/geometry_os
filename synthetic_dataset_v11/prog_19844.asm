; DESCRIPTION: Creates a purple rectangular region at (57, 29) spanning 19 by 74 pixels.
; PLAN: r0=57(x), r1=29(y), r2=19(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 29
LDI r2, 19
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
