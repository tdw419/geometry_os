; DESCRIPTION: Composite: . Then Places a black line segment connecting (237, 138) to (156, 184). Then Places a orange dot at position (204, 114).
; PLAN: r0=237(x1), r1=138(y1), r2=156(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (237, 138) to (156, 184).
; PLAN: r0=237(x1), r1=138(y1), r2=156(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 138
LDI r2, 156
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (204, 114).
; PLAN: r0=204(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
