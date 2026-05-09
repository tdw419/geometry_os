; DESCRIPTION: Composite: . Then Places a cyan circle of radius 51 at center (170, 141). Then Renders a black line between points (125, 130) and (233, 180).
; PLAN: r0=170(x), r1=141(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x1), r1=130(y1), r2=233(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 51 at center (170, 141).
; PLAN: r0=170(x), r1=141(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 141
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (125, 130) and (233, 180).
; PLAN: r0=125(x1), r1=130(y1), r2=233(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 130
LDI r2, 233
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
