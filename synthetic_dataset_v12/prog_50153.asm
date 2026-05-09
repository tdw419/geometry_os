; DESCRIPTION: Composite: Places a magenta line segment connecting (482, 209) to (296, 252) then Sets a single yellow pixel at (179, 3).
; PLAN: r0=482(x1), r1=209(y1), r2=296(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=3(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 209
LDI r2, 296
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 3
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
