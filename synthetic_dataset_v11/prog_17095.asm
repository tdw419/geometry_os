; DESCRIPTION: Composite: . Then Places a red circle of radius 60 at center (153, 186). Then Draws a black line from (186, 202) to (147, 195).
; PLAN: r0=153(x), r1=186(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x1), r1=202(y1), r2=147(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 60 at center (153, 186).
; PLAN: r0=153(x), r1=186(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 186
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (186, 202) to (147, 195).
; PLAN: r0=186(x1), r1=202(y1), r2=147(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 202
LDI r2, 147
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
