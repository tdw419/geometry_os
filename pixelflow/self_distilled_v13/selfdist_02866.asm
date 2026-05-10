; DESCRIPTION: Renders a magenta rectangular region spanning 27 by 47 at (315, 102).
; PLAN: r0=315(x), r1=102(y), r2=27(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 102
LDI r2, 27
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
