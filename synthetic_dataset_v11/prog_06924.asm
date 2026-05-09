; DESCRIPTION: Composite: . Then Draws a cyan line from (141, 225) to (179, 48). Then Renders a purple disk with center (78, 57) and radius 55.
; PLAN: r0=141(x1), r1=225(y1), r2=179(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=78(x), r1=57(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (141, 225) to (179, 48).
; PLAN: r0=141(x1), r1=225(y1), r2=179(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 225
LDI r2, 179
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (78, 57) and radius 55.
; PLAN: r0=78(x), r1=57(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 57
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
