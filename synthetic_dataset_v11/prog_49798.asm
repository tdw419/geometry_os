; DESCRIPTION: Composite: . Then Places a white circle of radius 16 at center (159, 104). Then Renders a magenta line between points (17, 182) and (169, 12).
; PLAN: r0=159(x), r1=104(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=17(x1), r1=182(y1), r2=169(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 16 at center (159, 104).
; PLAN: r0=159(x), r1=104(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 104
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (17, 182) and (169, 12).
; PLAN: r0=17(x1), r1=182(y1), r2=169(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 182
LDI r2, 169
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
