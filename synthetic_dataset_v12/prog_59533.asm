; DESCRIPTION: Renders a yellow line between points (296, 194) and (327, 115).
; PLAN: r0=296(x1), r1=194(y1), r2=327(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 194
LDI r2, 327
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
