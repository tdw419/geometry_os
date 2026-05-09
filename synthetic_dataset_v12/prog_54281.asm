; DESCRIPTION: Draws a yellow line from (484, 106) to (394, 170).
; PLAN: r0=484(x1), r1=106(y1), r2=394(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 106
LDI r2, 394
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
