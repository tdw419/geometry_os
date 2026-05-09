; DESCRIPTION: Creates a blue rectangular region at (440, 36) spanning 60 by 53 pixels.
; PLAN: r0=440(x), r1=36(y), r2=60(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 36
LDI r2, 60
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
