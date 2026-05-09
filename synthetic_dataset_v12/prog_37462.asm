; DESCRIPTION: Places a magenta 76x30 rectangle at position (383, 53).
; PLAN: r0=383(x), r1=53(y), r2=76(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 53
LDI r2, 76
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
