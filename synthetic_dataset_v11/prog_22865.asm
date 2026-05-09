; DESCRIPTION: Composite: . Then Renders a blue line between points (166, 77) and (11, 121). Then Places a orange circle of radius 37 at center (164, 146).
; PLAN: r0=166(x1), r1=77(y1), r2=11(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=164(x), r1=146(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (166, 77) and (11, 121).
; PLAN: r0=166(x1), r1=77(y1), r2=11(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 77
LDI r2, 11
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 37 at center (164, 146).
; PLAN: r0=164(x), r1=146(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 146
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
