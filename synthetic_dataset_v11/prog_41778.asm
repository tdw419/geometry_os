; DESCRIPTION: Composite: . Then Renders a yellow line between points (195, 4) and (27, 99). Then Places a green dot at position (204, 229).
; PLAN: r0=195(x1), r1=4(y1), r2=27(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=204(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (195, 4) and (27, 99).
; PLAN: r0=195(x1), r1=4(y1), r2=27(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 4
LDI r2, 27
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (204, 229).
; PLAN: r0=204(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 229
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
