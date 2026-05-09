; DESCRIPTION: Composite: . Then Renders a yellow disk with center (175, 112) and radius 60. Then Places a red line segment connecting (132, 87) to (174, 9).
; PLAN: r0=175(x), r1=112(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x1), r1=87(y1), r2=174(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (175, 112) and radius 60.
; PLAN: r0=175(x), r1=112(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 112
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (132, 87) to (174, 9).
; PLAN: r0=132(x1), r1=87(y1), r2=174(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 87
LDI r2, 174
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
