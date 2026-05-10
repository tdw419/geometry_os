; DESCRIPTION: Composite: Sets a single black pixel at (362, 94) then Draws a purple line from (237, 189) to (215, 178).
; PLAN: r0=362(x), r1=94(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=189(y1), r7=215(x2), r8=178(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 94
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 237
LDI r6, 189
LDI r7, 215
LDI r8, 178
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
