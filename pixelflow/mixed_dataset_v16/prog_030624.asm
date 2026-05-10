; DESCRIPTION: Draws a red line from (195, 241) to (433, 160).
; PLAN: r0=195(x1), r1=241(y1), r2=433(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 241
LDI r2, 433
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
