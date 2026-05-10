; DESCRIPTION: Places a yellow line segment connecting (116, 236) to (296, 186).
; PLAN: r0=116(x1), r1=236(y1), r2=296(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 236
LDI r2, 296
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
