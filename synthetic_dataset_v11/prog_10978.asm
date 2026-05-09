; DESCRIPTION: Places a magenta 57x84 rectangle at position (176, 72).
; PLAN: r0=176(x), r1=72(y), r2=57(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 72
LDI r2, 57
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
