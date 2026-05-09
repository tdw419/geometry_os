; DESCRIPTION: Composite: . Then Renders a white disk with center (63, 131) and radius 46. Then Draws a green line from (125, 57) to (160, 251).
; PLAN: r0=63(x), r1=131(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x1), r1=57(y1), r2=160(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (63, 131) and radius 46.
; PLAN: r0=63(x), r1=131(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 131
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (125, 57) to (160, 251).
; PLAN: r0=125(x1), r1=57(y1), r2=160(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 57
LDI r2, 160
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
