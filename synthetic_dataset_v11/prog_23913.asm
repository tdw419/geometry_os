; DESCRIPTION: Composite: . Then Places a red dot at position (90, 35). Then Renders a blue line between points (170, 249) and (139, 193).
; PLAN: r0=90(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=170(x1), r1=249(y1), r2=139(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (90, 35).
; PLAN: r0=90(x), r1=35(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 35
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (170, 249) and (139, 193).
; PLAN: r0=170(x1), r1=249(y1), r2=139(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 249
LDI r2, 139
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
