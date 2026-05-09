; DESCRIPTION: Composite: . Then Places a black circle of radius 19 at center (76, 175). Then Renders a cyan line between points (69, 189) and (22, 177).
; PLAN: r0=76(x), r1=175(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x1), r1=189(y1), r2=22(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 19 at center (76, 175).
; PLAN: r0=76(x), r1=175(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 175
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (69, 189) and (22, 177).
; PLAN: r0=69(x1), r1=189(y1), r2=22(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 189
LDI r2, 22
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
