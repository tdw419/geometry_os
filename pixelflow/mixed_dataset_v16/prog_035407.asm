; DESCRIPTION: Creates a purple rectangular region at (246, 46) spanning 99 by 89 pixels.
; PLAN: r0=246(x), r1=46(y), r2=99(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 46
LDI r2, 99
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
