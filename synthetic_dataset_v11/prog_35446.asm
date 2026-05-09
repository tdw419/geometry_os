; DESCRIPTION: Composite: . Then Renders a magenta line between points (145, 114) and (137, 43). Then Places a orange dot at position (154, 122).
; PLAN: r0=145(x1), r1=114(y1), r2=137(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (145, 114) and (137, 43).
; PLAN: r0=145(x1), r1=114(y1), r2=137(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 114
LDI r2, 137
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (154, 122).
; PLAN: r0=154(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 122
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
