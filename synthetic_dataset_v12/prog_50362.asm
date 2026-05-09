; DESCRIPTION: Renders a green line between points (310, 125) and (7, 9).
; PLAN: r0=310(x1), r1=125(y1), r2=7(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 125
LDI r2, 7
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
