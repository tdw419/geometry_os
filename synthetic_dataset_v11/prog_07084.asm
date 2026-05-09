; DESCRIPTION: Composite: . Then Draws a red line from (201, 220) to (175, 125). Then Draws a orange circle centered at (197, 140) with radius 46.
; PLAN: r0=201(x1), r1=220(y1), r2=175(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=197(x), r1=140(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (201, 220) to (175, 125).
; PLAN: r0=201(x1), r1=220(y1), r2=175(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 220
LDI r2, 175
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (197, 140) with radius 46.
; PLAN: r0=197(x), r1=140(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 140
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
