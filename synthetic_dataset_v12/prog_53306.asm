; DESCRIPTION: Draws a red line from (410, 50) to (472, 17).
; PLAN: r0=410(x1), r1=50(y1), r2=472(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 50
LDI r2, 472
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
