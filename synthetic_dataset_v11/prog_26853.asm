; DESCRIPTION: Creates a blue rectangular region at (53, 32) spanning 82 by 81 pixels.
; PLAN: r0=53(x), r1=32(y), r2=82(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 32
LDI r2, 82
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
