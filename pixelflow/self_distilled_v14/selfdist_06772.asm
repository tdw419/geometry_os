; DESCRIPTION: Renders a magenta rectangular region spanning 44 by 66 at (2, 146).
; PLAN: r0=2(x), r1=146(y), r2=44(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 146
LDI r2, 44
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
