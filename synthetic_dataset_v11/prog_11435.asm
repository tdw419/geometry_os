; DESCRIPTION: Creates a purple rectangular region at (167, 34) spanning 65 by 94 pixels.
; PLAN: r0=167(x), r1=34(y), r2=65(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 34
LDI r2, 65
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
