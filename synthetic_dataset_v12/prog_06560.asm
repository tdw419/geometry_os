; DESCRIPTION: Renders a magenta box of size 20x56 starting at (360, 81).
; PLAN: r0=360(x), r1=81(y), r2=20(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 81
LDI r2, 20
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
