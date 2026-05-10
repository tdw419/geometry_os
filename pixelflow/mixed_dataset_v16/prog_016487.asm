; DESCRIPTION: Renders a green line between points (56, 43) and (338, 46).
; PLAN: r0=56(x1), r1=43(y1), r2=338(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 43
LDI r2, 338
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
