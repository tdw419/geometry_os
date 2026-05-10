; DESCRIPTION: Renders a magenta rectangular region spanning 48 by 47 at (396, 188).
; PLAN: r0=396(x), r1=188(y), r2=48(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 188
LDI r2, 48
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
