; DESCRIPTION: Renders a magenta box of size 100x16 starting at (136, 92).
; PLAN: r0=136(x), r1=92(y), r2=100(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 92
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
