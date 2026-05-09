; DESCRIPTION: Composite: . Then Sets a single black pixel at (230, 187). Then Draws a yellow line from (237, 119) to (253, 246).
; PLAN: r0=230(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=237(x1), r1=119(y1), r2=253(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (230, 187).
; PLAN: r0=230(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (237, 119) to (253, 246).
; PLAN: r0=237(x1), r1=119(y1), r2=253(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 119
LDI r2, 253
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
