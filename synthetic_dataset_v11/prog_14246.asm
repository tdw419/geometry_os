; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (89, 49) with radius 40. Then Renders a white line between points (55, 180) and (221, 46).
; PLAN: r0=89(x), r1=49(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=180(y1), r2=221(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (89, 49) with radius 40.
; PLAN: r0=89(x), r1=49(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 49
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (55, 180) and (221, 46).
; PLAN: r0=55(x1), r1=180(y1), r2=221(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 180
LDI r2, 221
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
