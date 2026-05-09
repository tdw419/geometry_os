; DESCRIPTION: Renders a green line between points (38, 181) and (254, 33).
; PLAN: r0=38(x1), r1=181(y1), r2=254(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 181
LDI r2, 254
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
