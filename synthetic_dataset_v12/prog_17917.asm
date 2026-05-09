; DESCRIPTION: Composite: Draws a red line from (7, 125) to (244, 217) then Places a orange dot at position (165, 43).
; PLAN: r0=7(x1), r1=125(y1), r2=244(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=43(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 125
LDI r2, 244
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 43
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
