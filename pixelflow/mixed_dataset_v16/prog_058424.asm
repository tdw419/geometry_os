; DESCRIPTION: Composite: Sets a single blue pixel at (289, 21) then Draws a green line from (440, 178) to (445, 228).
; PLAN: r0=289(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=440(x1), r6=178(y1), r7=445(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 440
LDI r6, 178
LDI r7, 445
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
