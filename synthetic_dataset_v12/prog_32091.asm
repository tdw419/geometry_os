; DESCRIPTION: Composite: Renders a orange line between points (140, 105) and (196, 86) then Places a magenta dot at position (327, 147).
; PLAN: r0=140(x1), r1=105(y1), r2=196(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=147(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 105
LDI r2, 196
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 147
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
