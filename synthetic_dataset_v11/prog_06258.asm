; DESCRIPTION: Composite: . Then Places a white circle of radius 15 at center (98, 132). Then Renders a yellow line between points (81, 221) and (250, 122).
; PLAN: r0=98(x), r1=132(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=81(x1), r1=221(y1), r2=250(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 15 at center (98, 132).
; PLAN: r0=98(x), r1=132(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 132
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (81, 221) and (250, 122).
; PLAN: r0=81(x1), r1=221(y1), r2=250(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 221
LDI r2, 250
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
