; DESCRIPTION: Draws a red line from (192, 149) to (252, 160).
; PLAN: r0=192(x1), r1=149(y1), r2=252(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 149
LDI r2, 252
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
