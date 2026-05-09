; DESCRIPTION: Composite: . Then Draws a magenta line from (188, 182) to (89, 196). Then Renders a orange disk with center (73, 82) and radius 66.
; PLAN: r0=188(x1), r1=182(y1), r2=89(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=82(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (188, 182) to (89, 196).
; PLAN: r0=188(x1), r1=182(y1), r2=89(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 182
LDI r2, 89
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (73, 82) and radius 66.
; PLAN: r0=73(x), r1=82(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 82
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
