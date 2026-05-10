; DESCRIPTION: Composite: Draws a white line from (453, 60) to (227, 44) then Places a cyan dot at position (498, 85).
; PLAN: r0=453(x1), r1=60(y1), r2=227(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=85(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 60
LDI r2, 227
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 85
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
