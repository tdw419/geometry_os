; DESCRIPTION: Places a blue 20x15 rectangle at position (166, 89).
; PLAN: r0=166(x), r1=89(y), r2=20(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 89
LDI r2, 20
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
