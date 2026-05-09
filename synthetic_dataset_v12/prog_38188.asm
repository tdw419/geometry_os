; DESCRIPTION: Composite: Places a white line segment connecting (327, 115) to (366, 197) then Sets a single red pixel at (280, 106).
; PLAN: r0=327(x1), r1=115(y1), r2=366(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=106(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 115
LDI r2, 366
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 106
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
