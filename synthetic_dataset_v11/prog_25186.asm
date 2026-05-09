; DESCRIPTION: Composite: . Then Renders a orange line between points (156, 112) and (250, 114). Then Places a green dot at position (126, 223).
; PLAN: r0=156(x1), r1=112(y1), r2=250(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (156, 112) and (250, 114).
; PLAN: r0=156(x1), r1=112(y1), r2=250(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 112
LDI r2, 250
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (126, 223).
; PLAN: r0=126(x), r1=223(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 223
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
