; DESCRIPTION: Renders a magenta box of size 71x85 starting at (54, 131).
; PLAN: r0=54(x), r1=131(y), r2=71(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 131
LDI r2, 71
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
