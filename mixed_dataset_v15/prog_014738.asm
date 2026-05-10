; DESCRIPTION: Composite: Renders a magenta line between points (460, 76) and (51, 103) then Sets a single black pixel at (399, 63).
; PLAN: r0=460(x1), r1=76(y1), r2=51(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=63(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 76
LDI r2, 51
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 63
LDI r7, 0x000000
PSET r5, r6, r7
HALT
