; DESCRIPTION: Renders a yellow line between points (456, 203) and (296, 254).
; PLAN: r0=456(x1), r1=203(y1), r2=296(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 203
LDI r2, 296
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
