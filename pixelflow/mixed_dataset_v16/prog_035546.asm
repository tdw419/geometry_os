; DESCRIPTION: Renders a magenta box of size 106x117 starting at (60, 137).
; PLAN: r0=60(x), r1=137(y), r2=106(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 137
LDI r2, 106
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
