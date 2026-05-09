; DESCRIPTION: Draws a red line from (331, 186) to (203, 82).
; PLAN: r0=331(x1), r1=186(y1), r2=203(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 186
LDI r2, 203
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
