; DESCRIPTION: Renders a magenta box of size 14x101 starting at (25, 21).
; PLAN: r0=25(x), r1=21(y), r2=14(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 21
LDI r2, 14
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
