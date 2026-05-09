; DESCRIPTION: Renders a yellow line between points (95, 160) and (254, 76).
; PLAN: r0=95(x1), r1=160(y1), r2=254(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 160
LDI r2, 254
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
