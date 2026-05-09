; DESCRIPTION: Creates a blue rectangular region at (120, 29) spanning 53 by 32 pixels.
; PLAN: r0=120(x), r1=29(y), r2=53(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 29
LDI r2, 53
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
