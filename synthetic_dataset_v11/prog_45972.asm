; DESCRIPTION: Composite: . Then Places a blue circle of radius 48 at center (193, 127). Then Renders a cyan line between points (133, 244) and (15, 130).
; PLAN: r0=193(x), r1=127(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=133(x1), r1=244(y1), r2=15(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 48 at center (193, 127).
; PLAN: r0=193(x), r1=127(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 127
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (133, 244) and (15, 130).
; PLAN: r0=133(x1), r1=244(y1), r2=15(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 244
LDI r2, 15
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
