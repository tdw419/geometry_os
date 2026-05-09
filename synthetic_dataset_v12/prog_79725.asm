; DESCRIPTION: Composite: Draws a orange line from (427, 181) to (51, 16) then Places a green dot at position (115, 96).
; PLAN: r0=427(x1), r1=181(y1), r2=51(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=96(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 181
LDI r2, 51
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 96
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
