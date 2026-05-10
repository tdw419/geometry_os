; DESCRIPTION: Renders a magenta rectangular region spanning 44 by 27 at (267, 37).
; PLAN: r0=267(x), r1=37(y), r2=44(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 37
LDI r2, 44
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
