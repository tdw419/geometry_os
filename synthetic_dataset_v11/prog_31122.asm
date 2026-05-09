; DESCRIPTION: Composite: . Then Renders a orange line between points (85, 58) and (241, 217). Then Renders a magenta disk with center (65, 57) and radius 11.
; PLAN: r0=85(x1), r1=58(y1), r2=241(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=65(x), r1=57(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (85, 58) and (241, 217).
; PLAN: r0=85(x1), r1=58(y1), r2=241(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 58
LDI r2, 241
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (65, 57) and radius 11.
; PLAN: r0=65(x), r1=57(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 57
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
