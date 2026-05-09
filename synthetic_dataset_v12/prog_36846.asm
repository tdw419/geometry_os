; DESCRIPTION: Renders a yellow line between points (296, 52) and (57, 210).
; PLAN: r0=296(x1), r1=52(y1), r2=57(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 52
LDI r2, 57
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
