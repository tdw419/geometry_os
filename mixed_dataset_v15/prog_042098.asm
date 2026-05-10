; DESCRIPTION: Draws a red line from (282, 36) to (470, 84).
; PLAN: r0=282(x1), r1=36(y1), r2=470(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 36
LDI r2, 470
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
