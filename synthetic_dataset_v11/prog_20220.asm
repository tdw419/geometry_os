; DESCRIPTION: Renders a magenta box of size 64x29 starting at (158, 82).
; PLAN: r0=158(x), r1=82(y), r2=64(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 82
LDI r2, 64
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
