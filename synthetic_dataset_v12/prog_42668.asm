; DESCRIPTION: Renders a green line between points (52, 135) and (349, 122).
; PLAN: r0=52(x1), r1=135(y1), r2=349(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 135
LDI r2, 349
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
