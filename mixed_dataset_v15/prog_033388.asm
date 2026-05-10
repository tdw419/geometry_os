; DESCRIPTION: Composite: Places a green dot at position (258, 198) then Places a magenta line segment connecting (285, 116) to (471, 188).
; PLAN: r0=258(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=285(x1), r6=116(y1), r7=471(x2), r8=188(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 116
LDI r7, 471
LDI r8, 188
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
