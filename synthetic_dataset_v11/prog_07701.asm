; DESCRIPTION: Composite: . Then Draws a green line from (117, 152) to (91, 237). Then Renders a green disk with center (120, 159) and radius 34.
; PLAN: r0=117(x1), r1=152(y1), r2=91(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=120(x), r1=159(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (117, 152) to (91, 237).
; PLAN: r0=117(x1), r1=152(y1), r2=91(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 152
LDI r2, 91
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (120, 159) and radius 34.
; PLAN: r0=120(x), r1=159(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 159
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
