; DESCRIPTION: Composite: . Then Renders a blue line between points (134, 231) and (19, 200). Then Sets a single white pixel at (40, 227).
; PLAN: r0=134(x1), r1=231(y1), r2=19(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (134, 231) and (19, 200).
; PLAN: r0=134(x1), r1=231(y1), r2=19(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 231
LDI r2, 19
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (40, 227).
; PLAN: r0=40(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
