; DESCRIPTION: Composite: . Then Places a magenta dot at position (80, 153). Then Renders a purple line between points (158, 108) and (225, 222).
; PLAN: r0=80(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=158(x1), r1=108(y1), r2=225(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (80, 153).
; PLAN: r0=80(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (158, 108) and (225, 222).
; PLAN: r0=158(x1), r1=108(y1), r2=225(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 108
LDI r2, 225
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
