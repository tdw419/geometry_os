; DESCRIPTION: Composite: Renders a red line between points (25, 19) and (180, 187) then Places a yellow dot at position (428, 158).
; PLAN: r0=25(x1), r1=19(y1), r2=180(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=158(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 19
LDI r2, 180
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 158
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
