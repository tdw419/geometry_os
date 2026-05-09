; DESCRIPTION: Creates a purple rectangular region at (414, 122) spanning 24 by 93 pixels.
; PLAN: r0=414(x), r1=122(y), r2=24(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 122
LDI r2, 24
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
