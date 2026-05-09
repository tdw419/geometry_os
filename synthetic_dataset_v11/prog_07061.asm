; DESCRIPTION: Composite: . Then Sets a single red pixel at (187, 8). Then Renders a magenta line between points (215, 47) and (232, 22).
; PLAN: r0=187(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=215(x1), r1=47(y1), r2=232(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (187, 8).
; PLAN: r0=187(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta line between points (215, 47) and (232, 22).
; PLAN: r0=215(x1), r1=47(y1), r2=232(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 47
LDI r2, 232
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
