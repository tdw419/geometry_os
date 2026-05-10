; DESCRIPTION: Composite: Places a magenta line segment connecting (432, 217) to (91, 1) then Places a cyan dot at position (184, 133).
; PLAN: r0=432(x1), r1=217(y1), r2=91(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=133(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 217
LDI r2, 91
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 133
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
