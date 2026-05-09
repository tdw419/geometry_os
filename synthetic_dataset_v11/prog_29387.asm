; DESCRIPTION: Renders a magenta box of size 104x95 starting at (145, 118).
; PLAN: r0=145(x), r1=118(y), r2=104(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 118
LDI r2, 104
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
