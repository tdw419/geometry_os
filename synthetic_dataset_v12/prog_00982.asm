; DESCRIPTION: Renders a magenta box of size 102x52 starting at (64, 140).
; PLAN: r0=64(x), r1=140(y), r2=102(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 140
LDI r2, 102
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
