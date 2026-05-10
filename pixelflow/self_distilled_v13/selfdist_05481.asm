; DESCRIPTION: Renders a magenta rectangular region spanning 22 by 36 at (240, 133).
; PLAN: r0=240(x), r1=133(y), r2=22(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 133
LDI r2, 22
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
