; DESCRIPTION: Composite: . Then Places a green line segment connecting (241, 202) to (204, 229). Then Renders a red disk with center (138, 175) and radius 71.
; PLAN: r0=241(x1), r1=202(y1), r2=204(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=175(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (241, 202) to (204, 229).
; PLAN: r0=241(x1), r1=202(y1), r2=204(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 202
LDI r2, 204
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (138, 175) and radius 71.
; PLAN: r0=138(x), r1=175(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 175
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
