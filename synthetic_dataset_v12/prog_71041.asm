; DESCRIPTION: Draws a yellow line from (80, 116) to (229, 244).
; PLAN: r0=80(x1), r1=116(y1), r2=229(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 116
LDI r2, 229
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
