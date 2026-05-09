; DESCRIPTION: Composite: Places a yellow dot at position (278, 176) then Places a black line segment connecting (471, 94) to (107, 33).
; PLAN: r0=278(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=94(y1), r7=107(x2), r8=33(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 471
LDI r6, 94
LDI r7, 107
LDI r8, 33
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
