; DESCRIPTION: Composite: . Then Renders a magenta line between points (20, 119) and (214, 217). Then Places a black dot at position (61, 196).
; PLAN: r0=20(x1), r1=119(y1), r2=214(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=196(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (20, 119) and (214, 217).
; PLAN: r0=20(x1), r1=119(y1), r2=214(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 119
LDI r2, 214
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (61, 196).
; PLAN: r0=61(x), r1=196(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 196
LDI r2, 0x000000
PSET r0, r1, r2
HALT
