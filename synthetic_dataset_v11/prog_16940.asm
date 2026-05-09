; DESCRIPTION: Composite: . Then Renders a green line between points (74, 114) and (142, 214). Then Places a white dot at position (175, 131).
; PLAN: r0=74(x1), r1=114(y1), r2=142(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=175(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (74, 114) and (142, 214).
; PLAN: r0=74(x1), r1=114(y1), r2=142(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 114
LDI r2, 142
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (175, 131).
; PLAN: r0=175(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
