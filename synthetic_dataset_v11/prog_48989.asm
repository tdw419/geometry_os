; DESCRIPTION: Renders a magenta box of size 68x85 starting at (137, 7).
; PLAN: r0=137(x), r1=7(y), r2=68(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 7
LDI r2, 68
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
