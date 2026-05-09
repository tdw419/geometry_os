; DESCRIPTION: Composite: . Then Renders a green line between points (96, 1) and (144, 87). Then Draws a green circle centered at (149, 174) with radius 70.
; PLAN: r0=96(x1), r1=1(y1), r2=144(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=174(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (96, 1) and (144, 87).
; PLAN: r0=96(x1), r1=1(y1), r2=144(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 1
LDI r2, 144
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (149, 174) with radius 70.
; PLAN: r0=149(x), r1=174(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 174
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
