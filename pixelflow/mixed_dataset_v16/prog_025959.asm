; DESCRIPTION: Renders a magenta box of size 80x30 starting at (148, 119).
; PLAN: r0=148(x), r1=119(y), r2=80(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 80
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
