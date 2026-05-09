; DESCRIPTION: Places a blue 75x85 rectangle at position (261, 66).
; PLAN: r0=261(x), r1=66(y), r2=75(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 75
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
