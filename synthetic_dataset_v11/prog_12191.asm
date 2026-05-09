; DESCRIPTION: Composite: . Then Places a black line segment connecting (71, 237) to (148, 27). Then Places a yellow dot at position (136, 202).
; PLAN: r0=71(x1), r1=237(y1), r2=148(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=136(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (71, 237) to (148, 27).
; PLAN: r0=71(x1), r1=237(y1), r2=148(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 237
LDI r2, 148
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (136, 202).
; PLAN: r0=136(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
