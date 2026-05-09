; DESCRIPTION: Composite: Sets a single white pixel at (323, 24) then Renders a yellow line between points (38, 49) and (75, 29).
; PLAN: r0=323(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=38(x1), r6=49(y1), r7=75(x2), r8=29(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 49
LDI r7, 75
LDI r8, 29
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
