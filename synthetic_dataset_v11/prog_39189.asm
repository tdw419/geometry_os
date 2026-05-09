; DESCRIPTION: Composite: . Then Renders a blue disk with center (180, 161) and radius 70. Then Renders a yellow line between points (248, 59) and (223, 25).
; PLAN: r0=180(x), r1=161(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x1), r1=59(y1), r2=223(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (180, 161) and radius 70.
; PLAN: r0=180(x), r1=161(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 161
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (248, 59) and (223, 25).
; PLAN: r0=248(x1), r1=59(y1), r2=223(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 59
LDI r2, 223
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
