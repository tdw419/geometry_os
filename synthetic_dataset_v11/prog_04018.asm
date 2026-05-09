; DESCRIPTION: Composite: . Then Places a magenta dot at position (95, 65). Then Renders a purple line between points (172, 251) and (34, 143).
; PLAN: r0=95(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=172(x1), r1=251(y1), r2=34(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (95, 65).
; PLAN: r0=95(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (172, 251) and (34, 143).
; PLAN: r0=172(x1), r1=251(y1), r2=34(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 251
LDI r2, 34
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
