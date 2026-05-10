; DESCRIPTION: Renders a magenta box of size 36x36 starting at (414, 160).
; PLAN: r0=414(x), r1=160(y), r2=36(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 160
LDI r2, 36
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
