; DESCRIPTION: Renders a yellow line between points (53, 135) and (184, 241).
; PLAN: r0=53(x1), r1=135(y1), r2=184(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 135
LDI r2, 184
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
