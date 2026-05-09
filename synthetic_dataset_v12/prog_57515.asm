; DESCRIPTION: Composite: Creates a red circular shape at (440, 75) with radius 24 then Renders a red line between points (286, 141) and (115, 142).
; PLAN: r0=440(x), r1=75(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=141(y1), r7=115(x2), r8=142(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 75
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 141
LDI r7, 115
LDI r8, 142
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
