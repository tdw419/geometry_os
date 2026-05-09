; DESCRIPTION: Composite: . Then Places a black dot at position (220, 63). Then Renders a blue line between points (5, 149) and (51, 37).
; PLAN: r0=220(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=5(x1), r1=149(y1), r2=51(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (220, 63).
; PLAN: r0=220(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 63
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (5, 149) and (51, 37).
; PLAN: r0=5(x1), r1=149(y1), r2=51(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 149
LDI r2, 51
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
