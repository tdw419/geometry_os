; DESCRIPTION: Draws a red line from (52, 144) to (130, 135).
; PLAN: r0=52(x1), r1=144(y1), r2=130(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 144
LDI r2, 130
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
