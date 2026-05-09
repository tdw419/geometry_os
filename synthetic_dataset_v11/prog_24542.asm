; DESCRIPTION: Composite: . Then Renders a blue line between points (251, 55) and (211, 23). Then Places a green dot at position (247, 187).
; PLAN: r0=251(x1), r1=55(y1), r2=211(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=247(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (251, 55) and (211, 23).
; PLAN: r0=251(x1), r1=55(y1), r2=211(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 55
LDI r2, 211
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (247, 187).
; PLAN: r0=247(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
