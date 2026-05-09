; DESCRIPTION: Composite: . Then Renders a white line between points (94, 13) and (188, 206). Then Places a green circle of radius 66 at center (156, 66).
; PLAN: r0=94(x1), r1=13(y1), r2=188(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=66(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (94, 13) and (188, 206).
; PLAN: r0=94(x1), r1=13(y1), r2=188(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 13
LDI r2, 188
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 66 at center (156, 66).
; PLAN: r0=156(x), r1=66(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 66
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
