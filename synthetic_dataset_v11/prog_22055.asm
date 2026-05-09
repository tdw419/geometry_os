; DESCRIPTION: Composite: . Then Renders a red line between points (181, 85) and (214, 207). Then Places a yellow circle of radius 54 at center (162, 170).
; PLAN: r0=181(x1), r1=85(y1), r2=214(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=170(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (181, 85) and (214, 207).
; PLAN: r0=181(x1), r1=85(y1), r2=214(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 85
LDI r2, 214
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 54 at center (162, 170).
; PLAN: r0=162(x), r1=170(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 170
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
