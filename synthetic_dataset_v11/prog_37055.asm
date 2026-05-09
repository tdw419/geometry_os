; DESCRIPTION: Creates a purple rectangular region at (176, 23) spanning 31 by 74 pixels.
; PLAN: r0=176(x), r1=23(y), r2=31(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 23
LDI r2, 31
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
