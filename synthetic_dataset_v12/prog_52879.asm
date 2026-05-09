; DESCRIPTION: Draws a red line from (264, 49) to (367, 80).
; PLAN: r0=264(x1), r1=49(y1), r2=367(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 49
LDI r2, 367
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
