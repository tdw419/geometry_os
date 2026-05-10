; DESCRIPTION: Composite: Places a black line segment connecting (448, 225) to (427, 215) then Places a yellow dot at position (298, 146).
; PLAN: r0=448(x1), r1=225(y1), r2=427(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=146(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 225
LDI r2, 427
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 146
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
