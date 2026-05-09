; DESCRIPTION: Composite: . Then Draws a white line from (20, 85) to (86, 20). Then Renders a black disk with center (91, 97) and radius 75.
; PLAN: r0=20(x1), r1=85(y1), r2=86(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=97(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (20, 85) to (86, 20).
; PLAN: r0=20(x1), r1=85(y1), r2=86(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 85
LDI r2, 86
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (91, 97) and radius 75.
; PLAN: r0=91(x), r1=97(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 97
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
