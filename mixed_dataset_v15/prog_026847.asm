; DESCRIPTION: Renders a magenta box of size 105x20 starting at (118, 196).
; PLAN: r0=118(x), r1=196(y), r2=105(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 196
LDI r2, 105
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
