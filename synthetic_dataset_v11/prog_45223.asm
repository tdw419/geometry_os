; DESCRIPTION: Renders a yellow line between points (174, 56) and (5, 29).
; PLAN: r0=174(x1), r1=56(y1), r2=5(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 56
LDI r2, 5
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
