; DESCRIPTION: Renders a green line between points (296, 45) and (50, 163).
; PLAN: r0=296(x1), r1=45(y1), r2=50(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 45
LDI r2, 50
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
