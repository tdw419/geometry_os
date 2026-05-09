; DESCRIPTION: Draws a red line from (387, 17) to (222, 156).
; PLAN: r0=387(x1), r1=17(y1), r2=222(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 17
LDI r2, 222
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
