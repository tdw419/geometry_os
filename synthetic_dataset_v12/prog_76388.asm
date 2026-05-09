; DESCRIPTION: Renders a magenta box of size 92x22 starting at (189, 160).
; PLAN: r0=189(x), r1=160(y), r2=92(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 160
LDI r2, 92
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
