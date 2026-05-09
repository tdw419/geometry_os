; DESCRIPTION: Renders a green line between points (254, 26) and (13, 29).
; PLAN: r0=254(x1), r1=26(y1), r2=13(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 26
LDI r2, 13
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
