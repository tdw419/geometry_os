; DESCRIPTION: Renders a green line between points (238, 50) and (296, 135).
; PLAN: r0=238(x1), r1=50(y1), r2=296(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 50
LDI r2, 296
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
