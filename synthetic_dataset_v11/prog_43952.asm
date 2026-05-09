; DESCRIPTION: Places a blue 73x23 rectangle at position (53, 31).
; PLAN: r0=53(x), r1=31(y), r2=73(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 31
LDI r2, 73
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
