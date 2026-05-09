; DESCRIPTION: Composite: . Then Renders a black disk with center (123, 25) and radius 12. Then Draws a orange line from (9, 80) to (236, 184).
; PLAN: r0=123(x), r1=25(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x1), r1=80(y1), r2=236(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (123, 25) and radius 12.
; PLAN: r0=123(x), r1=25(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 25
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (9, 80) to (236, 184).
; PLAN: r0=9(x1), r1=80(y1), r2=236(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 80
LDI r2, 236
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
