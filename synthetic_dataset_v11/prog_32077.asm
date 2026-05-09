; DESCRIPTION: Creates a blue rectangular region at (159, 94) spanning 53 by 32 pixels.
; PLAN: r0=159(x), r1=94(y), r2=53(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 94
LDI r2, 53
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
