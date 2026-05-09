; DESCRIPTION: Composite: . Then Places a green circle of radius 30 at center (97, 125). Then Renders a magenta line between points (76, 147) and (52, 162).
; PLAN: r0=97(x), r1=125(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=76(x1), r1=147(y1), r2=52(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 30 at center (97, 125).
; PLAN: r0=97(x), r1=125(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 125
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (76, 147) and (52, 162).
; PLAN: r0=76(x1), r1=147(y1), r2=52(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 147
LDI r2, 52
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
