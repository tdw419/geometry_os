; DESCRIPTION: Renders a magenta box of size 93x50 starting at (185, 77).
; PLAN: r0=185(x), r1=77(y), r2=93(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 77
LDI r2, 93
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
