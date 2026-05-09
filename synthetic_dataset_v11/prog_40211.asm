; DESCRIPTION: Composite: . Then Places a white circle of radius 37 at center (170, 56). Then Draws a white line from (146, 60) to (119, 254).
; PLAN: r0=170(x), r1=56(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x1), r1=60(y1), r2=119(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 37 at center (170, 56).
; PLAN: r0=170(x), r1=56(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 56
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (146, 60) to (119, 254).
; PLAN: r0=146(x1), r1=60(y1), r2=119(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 60
LDI r2, 119
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
