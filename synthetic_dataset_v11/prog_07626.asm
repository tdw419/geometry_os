; DESCRIPTION: Composite: . Then Renders a purple line between points (55, 86) and (39, 131). Then Places a yellow dot at position (237, 127).
; PLAN: r0=55(x1), r1=86(y1), r2=39(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=237(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (55, 86) and (39, 131).
; PLAN: r0=55(x1), r1=86(y1), r2=39(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 86
LDI r2, 39
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (237, 127).
; PLAN: r0=237(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
