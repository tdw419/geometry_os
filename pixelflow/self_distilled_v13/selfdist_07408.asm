; DESCRIPTION: Renders a magenta rectangular region spanning 60 by 111 at (24, 141).
; PLAN: r0=24(x), r1=141(y), r2=60(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 141
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
