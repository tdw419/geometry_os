; DESCRIPTION: Places a magenta 44x53 rectangle at position (72, 36).
; PLAN: r0=72(x), r1=36(y), r2=44(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 36
LDI r2, 44
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
