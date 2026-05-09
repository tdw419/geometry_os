; DESCRIPTION: Composite: . Then Renders a purple line between points (125, 228) and (40, 48). Then Places a cyan circle of radius 48 at center (175, 58).
; PLAN: r0=125(x1), r1=228(y1), r2=40(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=175(x), r1=58(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (125, 228) and (40, 48).
; PLAN: r0=125(x1), r1=228(y1), r2=40(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 228
LDI r2, 40
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 48 at center (175, 58).
; PLAN: r0=175(x), r1=58(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 58
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
