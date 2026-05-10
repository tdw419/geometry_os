; DESCRIPTION: Composite: Places a yellow dot at position (392, 241) then Places a green line segment connecting (267, 6) to (400, 112).
; PLAN: r0=392(x), r1=241(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=267(x1), r6=6(y1), r7=400(x2), r8=112(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 241
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 267
LDI r6, 6
LDI r7, 400
LDI r8, 112
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
