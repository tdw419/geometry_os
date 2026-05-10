; DESCRIPTION: Renders a magenta rectangular region spanning 44 by 46 at (9, 86).
; PLAN: r0=9(x), r1=86(y), r2=44(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 86
LDI r2, 44
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
