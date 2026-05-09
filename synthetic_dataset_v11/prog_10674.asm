; DESCRIPTION: Composite: . Then Places a green circle of radius 39 at center (186, 213). Then Renders a purple line between points (143, 211) and (215, 80).
; PLAN: r0=186(x), r1=213(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=143(x1), r1=211(y1), r2=215(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 39 at center (186, 213).
; PLAN: r0=186(x), r1=213(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 213
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (143, 211) and (215, 80).
; PLAN: r0=143(x1), r1=211(y1), r2=215(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 211
LDI r2, 215
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
