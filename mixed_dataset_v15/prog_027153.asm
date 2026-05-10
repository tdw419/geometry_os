; DESCRIPTION: Places a magenta 86x20 rectangle at position (324, 130).
; PLAN: r0=324(x), r1=130(y), r2=86(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 130
LDI r2, 86
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
