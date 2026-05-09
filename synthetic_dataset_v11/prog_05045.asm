; DESCRIPTION: Composite: . Then Draws a green line from (69, 49) to (65, 241). Then Places a yellow circle of radius 57 at center (159, 144).
; PLAN: r0=69(x1), r1=49(y1), r2=65(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=144(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (69, 49) to (65, 241).
; PLAN: r0=69(x1), r1=49(y1), r2=65(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 49
LDI r2, 65
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 57 at center (159, 144).
; PLAN: r0=159(x), r1=144(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 144
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
