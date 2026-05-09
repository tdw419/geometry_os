; DESCRIPTION: Renders a magenta box of size 111x106 starting at (120, 148).
; PLAN: r0=120(x), r1=148(y), r2=111(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 148
LDI r2, 111
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
