; DESCRIPTION: Composite: . Then Places a blue dot at position (27, 154). Then Renders a red line between points (166, 51) and (64, 34).
; PLAN: r0=27(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=166(x1), r1=51(y1), r2=64(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (27, 154).
; PLAN: r0=27(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (166, 51) and (64, 34).
; PLAN: r0=166(x1), r1=51(y1), r2=64(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 51
LDI r2, 64
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
