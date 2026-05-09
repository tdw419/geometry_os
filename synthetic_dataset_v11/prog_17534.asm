; DESCRIPTION: Renders a magenta box of size 85x54 starting at (131, 115).
; PLAN: r0=131(x), r1=115(y), r2=85(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 115
LDI r2, 85
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
