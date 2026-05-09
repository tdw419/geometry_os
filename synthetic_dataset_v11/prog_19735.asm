; DESCRIPTION: Composite: . Then Places a green circle of radius 37 at center (105, 161). Then Renders a red line between points (19, 24) and (138, 67).
; PLAN: r0=105(x), r1=161(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x1), r1=24(y1), r2=138(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 37 at center (105, 161).
; PLAN: r0=105(x), r1=161(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 161
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (19, 24) and (138, 67).
; PLAN: r0=19(x1), r1=24(y1), r2=138(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 24
LDI r2, 138
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
