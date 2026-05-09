; DESCRIPTION: Draws a red line from (511, 202) to (195, 205).
; PLAN: r0=511(x1), r1=202(y1), r2=195(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 202
LDI r2, 195
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
