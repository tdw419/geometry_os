; DESCRIPTION: Composite: Draws a magenta line from (332, 150) to (40, 70) then Sets a single purple pixel at (460, 75).
; PLAN: r0=332(x1), r1=150(y1), r2=40(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=75(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 150
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 75
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
