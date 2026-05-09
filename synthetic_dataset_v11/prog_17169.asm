; DESCRIPTION: Composite: . Then Renders a black line between points (222, 171) and (80, 109). Then Renders a green disk with center (168, 52) and radius 50.
; PLAN: r0=222(x1), r1=171(y1), r2=80(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=52(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (222, 171) and (80, 109).
; PLAN: r0=222(x1), r1=171(y1), r2=80(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 171
LDI r2, 80
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (168, 52) and radius 50.
; PLAN: r0=168(x), r1=52(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 52
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
