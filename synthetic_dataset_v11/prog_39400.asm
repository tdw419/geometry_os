; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (169, 89) with radius 57. Then Renders a cyan line between points (122, 127) and (148, 98).
; PLAN: r0=169(x), r1=89(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=122(x1), r1=127(y1), r2=148(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (169, 89) with radius 57.
; PLAN: r0=169(x), r1=89(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 89
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (122, 127) and (148, 98).
; PLAN: r0=122(x1), r1=127(y1), r2=148(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 127
LDI r2, 148
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
