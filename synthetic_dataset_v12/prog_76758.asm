; DESCRIPTION: Renders a magenta box of size 115x112 starting at (156, 21).
; PLAN: r0=156(x), r1=21(y), r2=115(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 21
LDI r2, 115
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
