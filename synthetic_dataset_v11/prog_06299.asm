; DESCRIPTION: Composite: . Then Renders a yellow line between points (215, 214) and (191, 39). Then Places a yellow dot at position (94, 11).
; PLAN: r0=215(x1), r1=214(y1), r2=191(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (215, 214) and (191, 39).
; PLAN: r0=215(x1), r1=214(y1), r2=191(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 214
LDI r2, 191
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (94, 11).
; PLAN: r0=94(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
