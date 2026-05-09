; DESCRIPTION: Draws a red line from (133, 205) to (252, 126).
; PLAN: r0=133(x1), r1=205(y1), r2=252(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 205
LDI r2, 252
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
