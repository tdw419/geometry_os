; DESCRIPTION: Places a magenta 75x12 rectangle at position (84, 18).
; PLAN: r0=84(x), r1=18(y), r2=75(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 18
LDI r2, 75
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
