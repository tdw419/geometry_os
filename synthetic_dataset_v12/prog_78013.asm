; DESCRIPTION: Composite: Sets a single red pixel at (256, 132) then Draws a blue line from (21, 24) to (267, 191).
; PLAN: r0=256(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=24(y1), r7=267(x2), r8=191(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 21
LDI r6, 24
LDI r7, 267
LDI r8, 191
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
