; DESCRIPTION: Creates a blue rectangular region at (441, 35) spanning 53 by 115 pixels.
; PLAN: r0=441(x), r1=35(y), r2=53(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 35
LDI r2, 53
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
