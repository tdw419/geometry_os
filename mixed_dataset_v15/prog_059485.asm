; DESCRIPTION: Places a blue 47x53 rectangle at position (131, 168).
; PLAN: r0=131(x), r1=168(y), r2=47(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 168
LDI r2, 47
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
