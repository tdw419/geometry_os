; DESCRIPTION: Composite: . Then Renders a white disk with center (126, 84) and radius 64. Then Renders a yellow line between points (153, 98) and (182, 93).
; PLAN: r0=126(x), r1=84(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x1), r1=98(y1), r2=182(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (126, 84) and radius 64.
; PLAN: r0=126(x), r1=84(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 84
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (153, 98) and (182, 93).
; PLAN: r0=153(x1), r1=98(y1), r2=182(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 98
LDI r2, 182
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
