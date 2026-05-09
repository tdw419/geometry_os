; DESCRIPTION: Draws a red line from (353, 99) to (264, 38).
; PLAN: r0=353(x1), r1=99(y1), r2=264(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 99
LDI r2, 264
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
