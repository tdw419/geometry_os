; DESCRIPTION: Composite: Places a green dot at position (246, 211) then Renders a red line between points (449, 127) and (435, 58).
; PLAN: r0=246(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=449(x1), r6=127(y1), r7=435(x2), r8=58(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 449
LDI r6, 127
LDI r7, 435
LDI r8, 58
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
