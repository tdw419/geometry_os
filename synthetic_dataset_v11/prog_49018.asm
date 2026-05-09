; DESCRIPTION: Composite: . Then Places a green dot at position (120, 60). Then Places a black line segment connecting (145, 118) to (129, 95).
; PLAN: r0=120(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=145(x1), r1=118(y1), r2=129(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (120, 60).
; PLAN: r0=120(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (145, 118) to (129, 95).
; PLAN: r0=145(x1), r1=118(y1), r2=129(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 118
LDI r2, 129
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
