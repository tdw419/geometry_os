; DESCRIPTION: Composite: Places a blue dot at position (242, 118) then Renders a purple line between points (510, 82) and (136, 226).
; PLAN: r0=242(x), r1=118(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=82(y1), r7=136(x2), r8=226(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 118
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 510
LDI r6, 82
LDI r7, 136
LDI r8, 226
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
