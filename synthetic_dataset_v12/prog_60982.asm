; DESCRIPTION: Composite: Sets a single magenta pixel at (96, 132) then Renders a green line between points (101, 226) and (496, 29).
; PLAN: r0=96(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=226(y1), r7=496(x2), r8=29(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 226
LDI r7, 496
LDI r8, 29
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
