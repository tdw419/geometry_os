; DESCRIPTION: Places a magenta 102x56 rectangle at position (53, 11).
; PLAN: r0=53(x), r1=11(y), r2=102(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 11
LDI r2, 102
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
