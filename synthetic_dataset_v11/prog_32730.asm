; DESCRIPTION: Renders a yellow line between points (57, 113) and (254, 66).
; PLAN: r0=57(x1), r1=113(y1), r2=254(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 113
LDI r2, 254
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
