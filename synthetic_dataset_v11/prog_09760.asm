; DESCRIPTION: Creates a blue rectangular region at (184, 12) spanning 53 by 58 pixels.
; PLAN: r0=184(x), r1=12(y), r2=53(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 12
LDI r2, 53
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
