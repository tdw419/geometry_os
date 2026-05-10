; DESCRIPTION: Composite: Places a orange dot at position (279, 94) then Places a orange line segment connecting (426, 181) to (392, 232).
; PLAN: r0=279(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=181(y1), r7=392(x2), r8=232(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 426
LDI r6, 181
LDI r7, 392
LDI r8, 232
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
