; DESCRIPTION: Renders a yellow line between points (487, 184) and (511, 52).
; PLAN: r0=487(x1), r1=184(y1), r2=511(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 184
LDI r2, 511
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
