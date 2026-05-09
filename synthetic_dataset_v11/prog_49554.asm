; DESCRIPTION: Composite: . Then Renders a green line between points (61, 132) and (177, 198). Then Places a blue dot at position (71, 153).
; PLAN: r0=61(x1), r1=132(y1), r2=177(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=71(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (61, 132) and (177, 198).
; PLAN: r0=61(x1), r1=132(y1), r2=177(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 132
LDI r2, 177
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (71, 153).
; PLAN: r0=71(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
