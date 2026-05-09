; DESCRIPTION: Creates a blue rectangular region at (452, 165) spanning 53 by 82 pixels.
; PLAN: r0=452(x), r1=165(y), r2=53(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 165
LDI r2, 53
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
