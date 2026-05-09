; DESCRIPTION: Places a red line segment connecting (296, 238) to (341, 253).
; PLAN: r0=296(x1), r1=238(y1), r2=341(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 238
LDI r2, 341
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
