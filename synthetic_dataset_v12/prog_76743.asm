; DESCRIPTION: Creates a purple rectangular region at (263, 139) spanning 89 by 46 pixels.
; PLAN: r0=263(x), r1=139(y), r2=89(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 139
LDI r2, 89
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
