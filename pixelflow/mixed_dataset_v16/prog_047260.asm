; DESCRIPTION: Renders a magenta box of size 118x100 starting at (176, 68).
; PLAN: r0=176(x), r1=68(y), r2=118(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 68
LDI r2, 118
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
