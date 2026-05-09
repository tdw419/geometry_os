; DESCRIPTION: Renders a magenta box of size 112x94 starting at (247, 150).
; PLAN: r0=247(x), r1=150(y), r2=112(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 150
LDI r2, 112
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
