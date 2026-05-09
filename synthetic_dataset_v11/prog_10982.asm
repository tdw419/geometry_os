; DESCRIPTION: Composite: . Then Places a green dot at position (29, 112). Then Renders a orange line between points (211, 103) and (156, 234).
; PLAN: r0=29(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=211(x1), r1=103(y1), r2=156(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (29, 112).
; PLAN: r0=29(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (211, 103) and (156, 234).
; PLAN: r0=211(x1), r1=103(y1), r2=156(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 103
LDI r2, 156
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
