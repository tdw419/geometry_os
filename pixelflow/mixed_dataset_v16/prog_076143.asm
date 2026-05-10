; DESCRIPTION: Composite: Draws a orange line from (143, 65) to (211, 78) then Places a yellow dot at position (286, 113).
; PLAN: r0=143(x1), r1=65(y1), r2=211(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=113(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 65
LDI r2, 211
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 113
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
