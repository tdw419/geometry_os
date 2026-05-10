; DESCRIPTION: Renders a magenta box of size 87x81 starting at (196, 60).
; PLAN: r0=196(x), r1=60(y), r2=87(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 60
LDI r2, 87
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
