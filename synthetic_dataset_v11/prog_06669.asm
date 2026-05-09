; DESCRIPTION: Composite: . Then Renders a blue line between points (220, 17) and (146, 221). Then Places a green dot at position (102, 67).
; PLAN: r0=220(x1), r1=17(y1), r2=146(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (220, 17) and (146, 221).
; PLAN: r0=220(x1), r1=17(y1), r2=146(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 17
LDI r2, 146
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (102, 67).
; PLAN: r0=102(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
