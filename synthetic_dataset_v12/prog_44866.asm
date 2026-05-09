; DESCRIPTION: Composite: Places a yellow dot at position (287, 187) then Places a black line segment connecting (137, 77) to (182, 150).
; PLAN: r0=287(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=137(x1), r6=77(y1), r7=182(x2), r8=150(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 77
LDI r7, 182
LDI r8, 150
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
