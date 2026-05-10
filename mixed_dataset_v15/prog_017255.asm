; DESCRIPTION: Draws a green line from (376, 41) to (296, 218).
; PLAN: r0=376(x1), r1=41(y1), r2=296(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 41
LDI r2, 296
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
