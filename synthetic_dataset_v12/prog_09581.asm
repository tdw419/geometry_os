; DESCRIPTION: Draws a red line from (390, 18) to (398, 254).
; PLAN: r0=390(x1), r1=18(y1), r2=398(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 18
LDI r2, 398
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
