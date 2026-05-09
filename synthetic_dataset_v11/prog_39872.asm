; DESCRIPTION: Composite: . Then Renders a red line between points (233, 143) and (24, 215). Then Renders a green disk with center (129, 166) and radius 58.
; PLAN: r0=233(x1), r1=143(y1), r2=24(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=129(x), r1=166(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (233, 143) and (24, 215).
; PLAN: r0=233(x1), r1=143(y1), r2=24(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 143
LDI r2, 24
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (129, 166) and radius 58.
; PLAN: r0=129(x), r1=166(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 166
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
