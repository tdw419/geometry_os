; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (186, 184) with radius 31. Then Draws a red line from (211, 225) to (110, 189).
; PLAN: r0=186(x), r1=184(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x1), r1=225(y1), r2=110(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (186, 184) with radius 31.
; PLAN: r0=186(x), r1=184(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 184
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (211, 225) to (110, 189).
; PLAN: r0=211(x1), r1=225(y1), r2=110(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 225
LDI r2, 110
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
