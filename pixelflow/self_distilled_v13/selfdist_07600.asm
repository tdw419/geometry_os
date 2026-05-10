; DESCRIPTION: Renders a magenta rectangular region spanning 53 by 87 at (286, 75).
; PLAN: r0=286(x), r1=75(y), r2=53(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 75
LDI r2, 53
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
