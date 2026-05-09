; DESCRIPTION: Composite: . Then Renders a green line between points (96, 113) and (94, 88). Then Places a orange dot at position (51, 49).
; PLAN: r0=96(x1), r1=113(y1), r2=94(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=51(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (96, 113) and (94, 88).
; PLAN: r0=96(x1), r1=113(y1), r2=94(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 113
LDI r2, 94
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (51, 49).
; PLAN: r0=51(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
