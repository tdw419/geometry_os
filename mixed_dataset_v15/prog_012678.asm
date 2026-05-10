; DESCRIPTION: Renders a magenta box of size 95x68 starting at (314, 36).
; PLAN: r0=314(x), r1=36(y), r2=95(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 36
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
