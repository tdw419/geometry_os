; DESCRIPTION: Composite: Draws a magenta line from (275, 155) to (329, 126) then Sets a single purple pixel at (176, 202).
; PLAN: r0=275(x1), r1=155(y1), r2=329(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 155
LDI r2, 329
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
