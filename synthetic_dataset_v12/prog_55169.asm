; DESCRIPTION: Renders a magenta box of size 98x74 starting at (311, 10).
; PLAN: r0=311(x), r1=10(y), r2=98(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 10
LDI r2, 98
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
