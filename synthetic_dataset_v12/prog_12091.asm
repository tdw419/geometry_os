; DESCRIPTION: Composite: Draws a purple line from (49, 186) to (197, 254) then Places a white dot at position (455, 149).
; PLAN: r0=49(x1), r1=186(y1), r2=197(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=149(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 186
LDI r2, 197
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 149
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
