; DESCRIPTION: Renders a magenta box of size 92x112 starting at (80, 46).
; PLAN: r0=80(x), r1=46(y), r2=92(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 92
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
