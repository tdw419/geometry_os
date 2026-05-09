; DESCRIPTION: Draws a yellow line from (439, 236) to (233, 62).
; PLAN: r0=439(x1), r1=236(y1), r2=233(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 236
LDI r2, 233
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
