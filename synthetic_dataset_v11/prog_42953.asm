; DESCRIPTION: Creates a purple rectangular region at (65, 39) spanning 114 by 36 pixels.
; PLAN: r0=65(x), r1=39(y), r2=114(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 39
LDI r2, 114
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
