; DESCRIPTION: Renders a magenta box of size 118x10 starting at (88, 173).
; PLAN: r0=88(x), r1=173(y), r2=118(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 173
LDI r2, 118
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
