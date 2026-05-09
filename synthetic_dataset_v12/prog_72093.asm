; DESCRIPTION: Renders a magenta box of size 24x118 starting at (116, 20).
; PLAN: r0=116(x), r1=20(y), r2=24(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 20
LDI r2, 24
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
