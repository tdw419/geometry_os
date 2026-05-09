; DESCRIPTION: Composite: . Then Renders a cyan line between points (27, 131) and (225, 216). Then Places a white circle of radius 72 at center (172, 88).
; PLAN: r0=27(x1), r1=131(y1), r2=225(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=172(x), r1=88(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (27, 131) and (225, 216).
; PLAN: r0=27(x1), r1=131(y1), r2=225(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 131
LDI r2, 225
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 72 at center (172, 88).
; PLAN: r0=172(x), r1=88(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 88
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
