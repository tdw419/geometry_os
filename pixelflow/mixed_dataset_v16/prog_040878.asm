; DESCRIPTION: Draws a blue line from (296, 171) to (246, 104).
; PLAN: r0=296(x1), r1=171(y1), r2=246(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 171
LDI r2, 246
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
