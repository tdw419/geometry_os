; DESCRIPTION: Places a magenta 86x37 rectangle at position (290, 159).
; PLAN: r0=290(x), r1=159(y), r2=86(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 159
LDI r2, 86
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
