; DESCRIPTION: Creates a blue rectangular region at (61, 32) spanning 99 by 53 pixels.
; PLAN: r0=61(x), r1=32(y), r2=99(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 32
LDI r2, 99
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
