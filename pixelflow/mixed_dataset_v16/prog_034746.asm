; DESCRIPTION: Composite: Renders a yellow line between points (192, 230) and (51, 61) then Places a magenta dot at position (21, 127).
; PLAN: r0=192(x1), r1=230(y1), r2=51(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 230
LDI r2, 51
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
