; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (253, 162). Then Renders a blue line between points (220, 125) and (196, 164).
; PLAN: r0=253(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=220(x1), r1=125(y1), r2=196(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (253, 162).
; PLAN: r0=253(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (220, 125) and (196, 164).
; PLAN: r0=220(x1), r1=125(y1), r2=196(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 125
LDI r2, 196
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
