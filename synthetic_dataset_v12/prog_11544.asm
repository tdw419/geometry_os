; DESCRIPTION: Renders a magenta box of size 57x31 starting at (163, 189).
; PLAN: r0=163(x), r1=189(y), r2=57(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 189
LDI r2, 57
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
