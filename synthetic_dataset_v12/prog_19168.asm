; DESCRIPTION: Draws a red line from (0, 187) to (52, 241).
; PLAN: r0=0(x1), r1=187(y1), r2=52(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 187
LDI r2, 52
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
