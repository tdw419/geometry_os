; DESCRIPTION: Composite: . Then Renders a green line between points (95, 93) and (51, 17). Then Places a red dot at position (24, 187).
; PLAN: r0=95(x1), r1=93(y1), r2=51(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (95, 93) and (51, 17).
; PLAN: r0=95(x1), r1=93(y1), r2=51(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 93
LDI r2, 51
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (24, 187).
; PLAN: r0=24(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
