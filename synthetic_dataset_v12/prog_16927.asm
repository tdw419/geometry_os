; DESCRIPTION: Renders a magenta box of size 92x10 starting at (24, 140).
; PLAN: r0=24(x), r1=140(y), r2=92(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 140
LDI r2, 92
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
