; DESCRIPTION: Places a magenta 60x71 rectangle at position (13, 8).
; PLAN: r0=13(x), r1=8(y), r2=60(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 8
LDI r2, 60
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
