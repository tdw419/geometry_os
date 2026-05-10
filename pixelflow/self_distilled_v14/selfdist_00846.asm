; DESCRIPTION: Draws a red line from (365, 11) to (296, 4).
; PLAN: r0=365(x1), r1=11(y1), r2=296(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 11
LDI r2, 296
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
