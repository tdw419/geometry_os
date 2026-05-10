; DESCRIPTION: Renders a magenta box of size 68x111 starting at (396, 112).
; PLAN: r0=396(x), r1=112(y), r2=68(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 112
LDI r2, 68
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
