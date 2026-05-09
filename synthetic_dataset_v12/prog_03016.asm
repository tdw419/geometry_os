; DESCRIPTION: Draws a red line from (17, 143) to (406, 60).
; PLAN: r0=17(x1), r1=143(y1), r2=406(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 143
LDI r2, 406
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
