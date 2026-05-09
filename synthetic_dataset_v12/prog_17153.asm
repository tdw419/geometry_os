; DESCRIPTION: Draws a yellow line from (171, 241) to (395, 61).
; PLAN: r0=171(x1), r1=241(y1), r2=395(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 241
LDI r2, 395
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
