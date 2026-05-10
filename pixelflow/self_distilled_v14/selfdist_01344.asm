; DESCRIPTION: Creates a green filled rectangle of size 111x53 starting at (64, 155).
; PLAN: r0=64(x), r1=155(y), r2=111(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 155
LDI r2, 111
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
