; DESCRIPTION: Composite: Places a white dot at position (247, 13) then Renders a yellow line between points (190, 93) and (140, 150) then Creates a red circular shape at (399, 111) with radius 58.
; PLAN: r0=247(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=190(x1), r6=93(y1), r7=140(x2), r8=150(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=111(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 93
LDI r7, 140
LDI r8, 150
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 111
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
