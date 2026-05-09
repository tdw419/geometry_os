; DESCRIPTION: Places a magenta 59x98 rectangle at position (16, 53).
; PLAN: r0=16(x), r1=53(y), r2=59(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 53
LDI r2, 59
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
