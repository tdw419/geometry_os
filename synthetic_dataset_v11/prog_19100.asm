; DESCRIPTION: Composite: . Then Places a black circle of radius 40 at center (46, 57). Then Renders a white line between points (221, 26) and (80, 141).
; PLAN: r0=46(x), r1=57(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=221(x1), r1=26(y1), r2=80(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 40 at center (46, 57).
; PLAN: r0=46(x), r1=57(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 57
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (221, 26) and (80, 141).
; PLAN: r0=221(x1), r1=26(y1), r2=80(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 26
LDI r2, 80
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
