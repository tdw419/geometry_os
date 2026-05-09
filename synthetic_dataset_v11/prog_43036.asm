; DESCRIPTION: Places a magenta 15x107 rectangle at position (201, 144).
; PLAN: r0=201(x), r1=144(y), r2=15(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 144
LDI r2, 15
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
