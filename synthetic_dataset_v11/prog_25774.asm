; DESCRIPTION: Places a magenta 53x112 rectangle at position (72, 37).
; PLAN: r0=72(x), r1=37(y), r2=53(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 37
LDI r2, 53
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
