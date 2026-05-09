; DESCRIPTION: Places a magenta 79x84 rectangle at position (31, 82).
; PLAN: r0=31(x), r1=82(y), r2=79(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 82
LDI r2, 79
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
