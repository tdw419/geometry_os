; DESCRIPTION: Composite: . Then Renders a red line between points (123, 213) and (26, 17). Then Places a black circle of radius 58 at center (68, 129).
; PLAN: r0=123(x1), r1=213(y1), r2=26(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=68(x), r1=129(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (123, 213) and (26, 17).
; PLAN: r0=123(x1), r1=213(y1), r2=26(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 213
LDI r2, 26
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 58 at center (68, 129).
; PLAN: r0=68(x), r1=129(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 129
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
