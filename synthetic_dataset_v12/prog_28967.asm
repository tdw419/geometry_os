; DESCRIPTION: Renders a green line between points (296, 72) and (344, 225).
; PLAN: r0=296(x1), r1=72(y1), r2=344(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 72
LDI r2, 344
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
