; DESCRIPTION: Composite: . Then Renders a red line between points (137, 198) and (57, 125). Then Sets a single magenta pixel at (70, 163).
; PLAN: r0=137(x1), r1=198(y1), r2=57(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red line between points (137, 198) and (57, 125).
; PLAN: r0=137(x1), r1=198(y1), r2=57(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 198
LDI r2, 57
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (70, 163).
; PLAN: r0=70(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
