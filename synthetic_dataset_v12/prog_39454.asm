; DESCRIPTION: Composite: Draws a yellow line from (478, 221) to (270, 25) then Places a magenta dot at position (148, 85).
; PLAN: r0=478(x1), r1=221(y1), r2=270(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=85(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 478
LDI r1, 221
LDI r2, 270
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 85
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
