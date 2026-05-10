; DESCRIPTION: Creates a blue filled rectangle of size 53x60 starting at (125, 165).
; PLAN: r0=125(x), r1=165(y), r2=53(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 165
LDI r2, 53
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
