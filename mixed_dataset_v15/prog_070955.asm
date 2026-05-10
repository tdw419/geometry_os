; DESCRIPTION: Draws a red line from (450, 9) to (287, 26).
; PLAN: r0=450(x1), r1=9(y1), r2=287(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 9
LDI r2, 287
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
