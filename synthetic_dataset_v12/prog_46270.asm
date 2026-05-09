; DESCRIPTION: Places a magenta 64x73 rectangle at position (392, 8).
; PLAN: r0=392(x), r1=8(y), r2=64(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 8
LDI r2, 64
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
