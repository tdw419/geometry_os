; DESCRIPTION: Creates a purple rectangular region at (411, 101) spanning 71 by 71 pixels.
; PLAN: r0=411(x), r1=101(y), r2=71(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 101
LDI r2, 71
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
