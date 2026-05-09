; DESCRIPTION: Composite: Places a yellow dot at position (478, 165) then Renders a orange line between points (305, 235) and (209, 163).
; PLAN: r0=478(x), r1=165(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=235(y1), r7=209(x2), r8=163(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 165
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 305
LDI r6, 235
LDI r7, 209
LDI r8, 163
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
