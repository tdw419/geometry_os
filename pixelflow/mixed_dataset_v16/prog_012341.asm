; DESCRIPTION: Draws a white line from (296, 180) to (72, 36).
; PLAN: r0=296(x1), r1=180(y1), r2=72(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 180
LDI r2, 72
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
