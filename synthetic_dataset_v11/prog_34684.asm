; DESCRIPTION: Composite: . Then Places a purple dot at position (250, 108). Then Renders a blue line between points (217, 225) and (74, 22).
; PLAN: r0=250(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=217(x1), r1=225(y1), r2=74(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (250, 108).
; PLAN: r0=250(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (217, 225) and (74, 22).
; PLAN: r0=217(x1), r1=225(y1), r2=74(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 225
LDI r2, 74
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
