; DESCRIPTION: Composite: Renders a blue line between points (121, 118) and (396, 244) then Sets a single magenta pixel at (387, 109).
; PLAN: r0=121(x1), r1=118(y1), r2=396(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=109(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 118
LDI r2, 396
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 109
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
