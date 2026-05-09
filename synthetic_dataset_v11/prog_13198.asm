; DESCRIPTION: Composite: . Then Places a green dot at position (19, 221). Then Renders a blue line between points (38, 11) and (185, 158).
; PLAN: r0=19(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=38(x1), r1=11(y1), r2=185(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (19, 221).
; PLAN: r0=19(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 221
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (38, 11) and (185, 158).
; PLAN: r0=38(x1), r1=11(y1), r2=185(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 11
LDI r2, 185
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
