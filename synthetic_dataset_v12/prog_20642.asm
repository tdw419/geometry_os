; DESCRIPTION: Creates a blue rectangular region at (64, 60) spanning 48 by 53 pixels.
; PLAN: r0=64(x), r1=60(y), r2=48(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 60
LDI r2, 48
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
