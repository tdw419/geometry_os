; DESCRIPTION: Renders a magenta box of size 25x100 starting at (92, 76).
; PLAN: r0=92(x), r1=76(y), r2=25(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 76
LDI r2, 25
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
