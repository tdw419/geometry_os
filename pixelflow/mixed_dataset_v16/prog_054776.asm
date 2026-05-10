; DESCRIPTION: Places a magenta 63x47 rectangle at position (308, 179).
; PLAN: r0=308(x), r1=179(y), r2=63(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 179
LDI r2, 63
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
