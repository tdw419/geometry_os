; DESCRIPTION: Composite: . Then Places a purple circle of radius 67 at center (189, 119). Then Renders a cyan line between points (94, 46) and (17, 106).
; PLAN: r0=189(x), r1=119(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=94(x1), r1=46(y1), r2=17(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 67 at center (189, 119).
; PLAN: r0=189(x), r1=119(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 119
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (94, 46) and (17, 106).
; PLAN: r0=94(x1), r1=46(y1), r2=17(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 46
LDI r2, 17
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
