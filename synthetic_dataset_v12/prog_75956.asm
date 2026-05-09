; DESCRIPTION: Renders a magenta box of size 118x96 starting at (308, 10).
; PLAN: r0=308(x), r1=10(y), r2=118(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 10
LDI r2, 118
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
