; DESCRIPTION: Composite: . Then Renders a black line between points (123, 130) and (178, 112). Then Places a green dot at position (36, 226).
; PLAN: r0=123(x1), r1=130(y1), r2=178(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (123, 130) and (178, 112).
; PLAN: r0=123(x1), r1=130(y1), r2=178(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 130
LDI r2, 178
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (36, 226).
; PLAN: r0=36(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 226
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
