; DESCRIPTION: Places a magenta 26x32 rectangle at position (356, 94).
; PLAN: r0=356(x), r1=94(y), r2=26(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 94
LDI r2, 26
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
