; DESCRIPTION: Composite: . Then Renders a red line between points (136, 54) and (73, 233). Then Draws a red circle centered at (177, 151) with radius 66.
; PLAN: r0=136(x1), r1=54(y1), r2=73(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=177(x), r1=151(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (136, 54) and (73, 233).
; PLAN: r0=136(x1), r1=54(y1), r2=73(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 54
LDI r2, 73
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (177, 151) with radius 66.
; PLAN: r0=177(x), r1=151(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 151
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
