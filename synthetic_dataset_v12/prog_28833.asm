; DESCRIPTION: Draws a red line from (87, 49) to (20, 221).
; PLAN: r0=87(x1), r1=49(y1), r2=20(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 49
LDI r2, 20
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
