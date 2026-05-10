; DESCRIPTION: Renders a red line segment connecting (296, 174) to (210, 199).
; PLAN: r0=296(x1), r1=174(y1), r2=210(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 174
LDI r2, 210
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
