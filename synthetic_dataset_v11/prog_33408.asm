; DESCRIPTION: Renders a magenta box of size 116x68 starting at (54, 158).
; PLAN: r0=54(x), r1=158(y), r2=116(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 158
LDI r2, 116
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
