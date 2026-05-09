; DESCRIPTION: Creates a purple rectangular region at (304, 109) spanning 24 by 43 pixels.
; PLAN: r0=304(x), r1=109(y), r2=24(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 109
LDI r2, 24
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
