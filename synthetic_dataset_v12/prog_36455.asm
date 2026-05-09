; DESCRIPTION: Creates a purple rectangular region at (296, 73) spanning 101 by 105 pixels.
; PLAN: r0=296(x), r1=73(y), r2=101(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 73
LDI r2, 101
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
