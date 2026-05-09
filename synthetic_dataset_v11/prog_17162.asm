; DESCRIPTION: Composite: . Then Renders a blue line between points (48, 248) and (238, 159). Then Places a red dot at position (204, 123).
; PLAN: r0=48(x1), r1=248(y1), r2=238(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (48, 248) and (238, 159).
; PLAN: r0=48(x1), r1=248(y1), r2=238(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 248
LDI r2, 238
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (204, 123).
; PLAN: r0=204(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
