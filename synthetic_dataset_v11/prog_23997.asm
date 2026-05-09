; DESCRIPTION: Draws a red line from (107, 87) to (202, 241).
; PLAN: r0=107(x1), r1=87(y1), r2=202(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 87
LDI r2, 202
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
