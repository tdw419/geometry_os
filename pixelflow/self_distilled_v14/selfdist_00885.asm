; DESCRIPTION: Renders a magenta rectangular region spanning 13 by 115 at (360, 4).
; PLAN: r0=360(x), r1=4(y), r2=13(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 4
LDI r2, 13
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
