; DESCRIPTION: Composite: . Then Renders a magenta line between points (91, 155) and (72, 82). Then Sets a single blue pixel at (57, 96).
; PLAN: r0=91(x1), r1=155(y1), r2=72(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=57(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (91, 155) and (72, 82).
; PLAN: r0=91(x1), r1=155(y1), r2=72(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 155
LDI r2, 72
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (57, 96).
; PLAN: r0=57(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
