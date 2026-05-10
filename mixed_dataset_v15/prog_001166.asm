; DESCRIPTION: Renders a magenta rectangular region spanning 17 by 75 at (369, 180).
; PLAN: r0=369(x), r1=180(y), r2=17(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 180
LDI r2, 17
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
