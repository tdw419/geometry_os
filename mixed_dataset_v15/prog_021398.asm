; DESCRIPTION: Renders a magenta rectangular region spanning 36 by 111 at (185, 159).
; PLAN: r0=185(x), r1=159(y), r2=36(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 159
LDI r2, 36
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
