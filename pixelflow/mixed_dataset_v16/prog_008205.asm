; DESCRIPTION: Draws a yellow line from (502, 95) to (217, 169).
; PLAN: r0=502(x1), r1=95(y1), r2=217(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 95
LDI r2, 217
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
