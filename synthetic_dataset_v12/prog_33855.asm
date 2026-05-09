; DESCRIPTION: Renders a magenta box of size 89x112 starting at (200, 134).
; PLAN: r0=200(x), r1=134(y), r2=89(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 134
LDI r2, 89
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
