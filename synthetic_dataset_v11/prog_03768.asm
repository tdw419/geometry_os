; DESCRIPTION: Renders a magenta box of size 113x57 starting at (30, 119).
; PLAN: r0=30(x), r1=119(y), r2=113(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 119
LDI r2, 113
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
