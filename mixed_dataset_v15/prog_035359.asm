; DESCRIPTION: Places a magenta 63x90 rectangle at position (53, 5).
; PLAN: r0=53(x), r1=5(y), r2=63(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 5
LDI r2, 63
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
