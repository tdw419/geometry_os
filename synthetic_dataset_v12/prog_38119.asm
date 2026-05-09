; DESCRIPTION: Renders a magenta box of size 70x57 starting at (282, 105).
; PLAN: r0=282(x), r1=105(y), r2=70(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 105
LDI r2, 70
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
