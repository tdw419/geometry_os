; DESCRIPTION: Renders a green line between points (91, 17) and (183, 165).
; PLAN: r0=91(x1), r1=17(y1), r2=183(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 17
LDI r2, 183
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
