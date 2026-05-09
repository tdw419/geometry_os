; DESCRIPTION: Places a magenta 95x103 rectangle at position (64, 105).
; PLAN: r0=64(x), r1=105(y), r2=95(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 105
LDI r2, 95
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
