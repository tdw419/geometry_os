; DESCRIPTION: Renders a green line between points (325, 59) and (500, 70).
; PLAN: r0=325(x1), r1=59(y1), r2=500(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 59
LDI r2, 500
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
