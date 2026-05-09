; DESCRIPTION: Composite: Draws a green line from (278, 139) to (43, 243) then Places a orange dot at position (439, 127).
; PLAN: r0=278(x1), r1=139(y1), r2=43(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=127(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 139
LDI r2, 43
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 127
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
