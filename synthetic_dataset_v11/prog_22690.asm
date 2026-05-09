; DESCRIPTION: Renders a magenta box of size 20x12 starting at (87, 35).
; PLAN: r0=87(x), r1=35(y), r2=20(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 35
LDI r2, 20
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
