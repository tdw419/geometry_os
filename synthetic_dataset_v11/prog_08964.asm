; DESCRIPTION: Composite: . Then Renders a black disk with center (156, 149) and radius 31. Then Renders a white line between points (132, 216) and (177, 184).
; PLAN: r0=156(x), r1=149(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x1), r1=216(y1), r2=177(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (156, 149) and radius 31.
; PLAN: r0=156(x), r1=149(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 149
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (132, 216) and (177, 184).
; PLAN: r0=132(x1), r1=216(y1), r2=177(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 216
LDI r2, 177
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
