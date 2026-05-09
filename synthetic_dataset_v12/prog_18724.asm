; DESCRIPTION: Places a magenta 32x79 rectangle at position (75, 61).
; PLAN: r0=75(x), r1=61(y), r2=32(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 61
LDI r2, 32
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
