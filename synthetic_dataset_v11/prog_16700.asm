; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (44, 37). Then Draws a black line from (108, 171) to (104, 147).
; PLAN: r0=44(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=108(x1), r1=171(y1), r2=104(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (44, 37).
; PLAN: r0=44(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (108, 171) to (104, 147).
; PLAN: r0=108(x1), r1=171(y1), r2=104(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 171
LDI r2, 104
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
