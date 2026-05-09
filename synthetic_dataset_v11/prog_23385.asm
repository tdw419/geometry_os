; DESCRIPTION: Places a magenta 34x63 rectangle at position (220, 79).
; PLAN: r0=220(x), r1=79(y), r2=34(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 79
LDI r2, 34
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
