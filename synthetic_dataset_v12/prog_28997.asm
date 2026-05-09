; DESCRIPTION: Renders a green line between points (370, 9) and (500, 114).
; PLAN: r0=370(x1), r1=9(y1), r2=500(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 9
LDI r2, 500
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
