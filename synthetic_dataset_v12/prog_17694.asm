; DESCRIPTION: Composite: Draws a cyan line from (356, 180) to (223, 213) then Sets a single black pixel at (261, 252).
; PLAN: r0=356(x1), r1=180(y1), r2=223(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=252(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 180
LDI r2, 223
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 252
LDI r7, 0x000000
PSET r5, r6, r7
HALT
