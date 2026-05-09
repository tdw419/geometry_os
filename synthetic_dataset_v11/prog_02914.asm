; DESCRIPTION: Composite: . Then Places a cyan circle of radius 22 at center (65, 100). Then Renders a purple line between points (228, 132) and (194, 26).
; PLAN: r0=65(x), r1=100(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=228(x1), r1=132(y1), r2=194(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 22 at center (65, 100).
; PLAN: r0=65(x), r1=100(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 100
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (228, 132) and (194, 26).
; PLAN: r0=228(x1), r1=132(y1), r2=194(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 132
LDI r2, 194
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
