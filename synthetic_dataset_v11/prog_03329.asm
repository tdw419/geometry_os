; DESCRIPTION: Composite: . Then Renders a white line between points (147, 146) and (234, 100). Then Places a yellow circle of radius 22 at center (75, 228).
; PLAN: r0=147(x1), r1=146(y1), r2=234(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=75(x), r1=228(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (147, 146) and (234, 100).
; PLAN: r0=147(x1), r1=146(y1), r2=234(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 146
LDI r2, 234
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 22 at center (75, 228).
; PLAN: r0=75(x), r1=228(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 228
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
