; DESCRIPTION: Places a blue 73x80 rectangle at position (183, 53).
; PLAN: r0=183(x), r1=53(y), r2=73(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 53
LDI r2, 73
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
