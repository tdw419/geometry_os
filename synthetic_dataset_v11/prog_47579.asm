; DESCRIPTION: Composite: . Then Places a cyan circle of radius 64 at center (181, 155). Then Renders a purple line between points (246, 82) and (254, 69).
; PLAN: r0=181(x), r1=155(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=246(x1), r1=82(y1), r2=254(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 64 at center (181, 155).
; PLAN: r0=181(x), r1=155(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 155
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (246, 82) and (254, 69).
; PLAN: r0=246(x1), r1=82(y1), r2=254(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 82
LDI r2, 254
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
