; DESCRIPTION: Renders a yellow line between points (171, 56) and (130, 76).
; PLAN: r0=171(x1), r1=56(y1), r2=130(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 56
LDI r2, 130
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
