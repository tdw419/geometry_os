; DESCRIPTION: Creates a blue rectangular region at (32, 28) spanning 96 by 53 pixels.
; PLAN: r0=32(x), r1=28(y), r2=96(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 28
LDI r2, 96
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
