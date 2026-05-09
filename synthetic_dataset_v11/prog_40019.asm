; DESCRIPTION: Composite: . Then Renders a magenta line between points (12, 250) and (29, 138). Then Sets a single white pixel at (170, 39).
; PLAN: r0=12(x1), r1=250(y1), r2=29(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=39(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (12, 250) and (29, 138).
; PLAN: r0=12(x1), r1=250(y1), r2=29(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 250
LDI r2, 29
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (170, 39).
; PLAN: r0=170(x), r1=39(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 39
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
