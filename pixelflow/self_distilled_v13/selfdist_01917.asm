; DESCRIPTION: Renders a magenta rectangular region spanning 90 by 93 at (310, 31).
; PLAN: r0=310(x), r1=31(y), r2=90(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 31
LDI r2, 90
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
