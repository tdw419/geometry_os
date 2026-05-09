; DESCRIPTION: Places a magenta 78x32 rectangle at position (53, 220).
; PLAN: r0=53(x), r1=220(y), r2=78(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 220
LDI r2, 78
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
