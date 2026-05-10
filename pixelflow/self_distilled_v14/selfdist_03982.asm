; DESCRIPTION: Draws a red line from (298, 120) to (334, 97).
; PLAN: r0=298(x1), r1=120(y1), r2=334(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 120
LDI r2, 334
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
