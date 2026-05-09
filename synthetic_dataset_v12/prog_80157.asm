; DESCRIPTION: Composite: Places a magenta line segment connecting (116, 91) to (440, 235) then Sets a single blue pixel at (299, 182).
; PLAN: r0=116(x1), r1=91(y1), r2=440(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=182(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 91
LDI r2, 440
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 182
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
