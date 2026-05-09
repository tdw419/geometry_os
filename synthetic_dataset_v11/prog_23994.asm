; DESCRIPTION: Composite: . Then Renders a black line between points (131, 114) and (140, 213). Then Places a yellow dot at position (2, 38).
; PLAN: r0=131(x1), r1=114(y1), r2=140(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=2(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (131, 114) and (140, 213).
; PLAN: r0=131(x1), r1=114(y1), r2=140(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 114
LDI r2, 140
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (2, 38).
; PLAN: r0=2(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 38
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
