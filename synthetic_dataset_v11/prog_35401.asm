; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (77, 20) to (198, 22). Then Renders a orange disk with center (79, 72) and radius 40.
; PLAN: r0=77(x1), r1=20(y1), r2=198(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=72(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow line segment connecting (77, 20) to (198, 22).
; PLAN: r0=77(x1), r1=20(y1), r2=198(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 20
LDI r2, 198
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (79, 72) and radius 40.
; PLAN: r0=79(x), r1=72(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 72
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
