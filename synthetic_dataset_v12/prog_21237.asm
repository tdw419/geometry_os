; DESCRIPTION: Composite: Places a red line segment connecting (128, 175) to (368, 1) then Places a orange dot at position (89, 103).
; PLAN: r0=128(x1), r1=175(y1), r2=368(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=103(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 175
LDI r2, 368
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 103
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
