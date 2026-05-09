; DESCRIPTION: Places a red line segment connecting (400, 102) to (296, 103).
; PLAN: r0=400(x1), r1=102(y1), r2=296(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 102
LDI r2, 296
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
