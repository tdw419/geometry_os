; DESCRIPTION: Composite: . Then Draws a yellow line from (192, 131) to (33, 125). Then Sets a single black pixel at (189, 109).
; PLAN: r0=192(x1), r1=131(y1), r2=33(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=189(x), r1=109(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (192, 131) to (33, 125).
; PLAN: r0=192(x1), r1=131(y1), r2=33(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 131
LDI r2, 33
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (189, 109).
; PLAN: r0=189(x), r1=109(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 109
LDI r2, 0x000000
PSET r0, r1, r2
HALT
