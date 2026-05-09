; DESCRIPTION: Renders a magenta box of size 118x91 starting at (250, 57).
; PLAN: r0=250(x), r1=57(y), r2=118(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 57
LDI r2, 118
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
