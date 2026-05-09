; DESCRIPTION: Composite: Places a red line segment connecting (472, 167) to (366, 127) then Places a cyan dot at position (453, 114).
; PLAN: r0=472(x1), r1=167(y1), r2=366(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=114(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 472
LDI r1, 167
LDI r2, 366
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 114
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
