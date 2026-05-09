; DESCRIPTION: Composite: Draws a green line from (80, 46) to (53, 251) then Places a orange dot at position (70, 75).
; PLAN: r0=80(x1), r1=46(y1), r2=53(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=75(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 46
LDI r2, 53
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 75
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
