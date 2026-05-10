; DESCRIPTION: Renders a magenta rectangular region spanning 61 by 66 at (71, 198).
; PLAN: r0=71(x), r1=198(y), r2=61(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 198
LDI r2, 61
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
