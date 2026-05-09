; DESCRIPTION: Draws a white line from (144, 198) to (59, 169).
; PLAN: r0=144(x1), r1=198(y1), r2=59(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 198
LDI r2, 59
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
