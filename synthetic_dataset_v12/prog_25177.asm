; DESCRIPTION: Renders a yellow line between points (395, 141) and (499, 121).
; PLAN: r0=395(x1), r1=141(y1), r2=499(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 141
LDI r2, 499
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
