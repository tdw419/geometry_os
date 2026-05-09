; DESCRIPTION: Composite: . Then Places a red line segment connecting (237, 1) to (253, 65). Then Renders a red disk with center (196, 161) and radius 45.
; PLAN: r0=237(x1), r1=1(y1), r2=253(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=196(x), r1=161(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (237, 1) to (253, 65).
; PLAN: r0=237(x1), r1=1(y1), r2=253(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 1
LDI r2, 253
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (196, 161) and radius 45.
; PLAN: r0=196(x), r1=161(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 161
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
