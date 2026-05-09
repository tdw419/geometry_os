; DESCRIPTION: Composite: . Then Renders a blue line between points (208, 15) and (240, 74). Then Sets a single magenta pixel at (167, 100).
; PLAN: r0=208(x1), r1=15(y1), r2=240(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=167(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (208, 15) and (240, 74).
; PLAN: r0=208(x1), r1=15(y1), r2=240(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 15
LDI r2, 240
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (167, 100).
; PLAN: r0=167(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 100
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
