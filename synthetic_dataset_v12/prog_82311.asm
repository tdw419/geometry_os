; DESCRIPTION: Creates a purple rectangular region at (53, 142) spanning 29 by 105 pixels.
; PLAN: r0=53(x), r1=142(y), r2=29(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 142
LDI r2, 29
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
