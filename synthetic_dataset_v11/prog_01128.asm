; DESCRIPTION: Composite: . Then Places a blue dot at position (147, 225). Then Renders a blue line between points (6, 235) and (114, 63).
; PLAN: r0=147(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=6(x1), r1=235(y1), r2=114(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (147, 225).
; PLAN: r0=147(x), r1=225(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 225
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (6, 235) and (114, 63).
; PLAN: r0=6(x1), r1=235(y1), r2=114(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 235
LDI r2, 114
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
