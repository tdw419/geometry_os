; DESCRIPTION: Composite: . Then Places a green circle of radius 27 at center (119, 48). Then Places a magenta line segment connecting (241, 125) to (47, 25).
; PLAN: r0=119(x), r1=48(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x1), r1=125(y1), r2=47(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 27 at center (119, 48).
; PLAN: r0=119(x), r1=48(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 48
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (241, 125) to (47, 25).
; PLAN: r0=241(x1), r1=125(y1), r2=47(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 125
LDI r2, 47
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
