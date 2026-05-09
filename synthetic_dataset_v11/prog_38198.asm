; DESCRIPTION: Places a magenta 10x87 rectangle at position (157, 79).
; PLAN: r0=157(x), r1=79(y), r2=10(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 79
LDI r2, 10
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
