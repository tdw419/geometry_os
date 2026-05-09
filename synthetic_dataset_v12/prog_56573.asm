; DESCRIPTION: Renders a green line between points (338, 135) and (22, 141).
; PLAN: r0=338(x1), r1=135(y1), r2=22(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 135
LDI r2, 22
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
