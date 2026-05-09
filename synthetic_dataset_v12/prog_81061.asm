; DESCRIPTION: Draws a red line from (16, 234) to (43, 206).
; PLAN: r0=16(x1), r1=234(y1), r2=43(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 234
LDI r2, 43
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
