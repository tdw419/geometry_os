; DESCRIPTION: Composite: . Then Places a yellow dot at position (109, 49). Then Draws a orange line from (204, 225) to (237, 27).
; PLAN: r0=109(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=204(x1), r1=225(y1), r2=237(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (109, 49).
; PLAN: r0=109(x), r1=49(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 49
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (204, 225) to (237, 27).
; PLAN: r0=204(x1), r1=225(y1), r2=237(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 225
LDI r2, 237
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
