; DESCRIPTION: Renders a magenta rectangular region spanning 117 by 61 at (91, 169).
; PLAN: r0=91(x), r1=169(y), r2=117(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 169
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
