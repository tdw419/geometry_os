; DESCRIPTION: Renders a magenta box of size 30x92 starting at (68, 30).
; PLAN: r0=68(x), r1=30(y), r2=30(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 30
LDI r2, 30
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
