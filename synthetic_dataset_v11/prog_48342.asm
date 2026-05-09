; DESCRIPTION: Composite: . Then Renders a green line between points (21, 156) and (251, 91). Then Places a white circle of radius 35 at center (77, 196).
; PLAN: r0=21(x1), r1=156(y1), r2=251(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=196(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (21, 156) and (251, 91).
; PLAN: r0=21(x1), r1=156(y1), r2=251(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 156
LDI r2, 251
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 35 at center (77, 196).
; PLAN: r0=77(x), r1=196(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 196
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
