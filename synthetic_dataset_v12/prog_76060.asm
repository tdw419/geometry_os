; DESCRIPTION: Places a blue 112x103 rectangle at position (308, 151).
; PLAN: r0=308(x), r1=151(y), r2=112(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 151
LDI r2, 112
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
