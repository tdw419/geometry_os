; DESCRIPTION: Renders a green line between points (60, 174) and (407, 20).
; PLAN: r0=60(x1), r1=174(y1), r2=407(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 174
LDI r2, 407
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
