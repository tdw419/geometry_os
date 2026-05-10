; DESCRIPTION: Draws a yellow line from (397, 169) to (213, 59).
; PLAN: r0=397(x1), r1=169(y1), r2=213(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 169
LDI r2, 213
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
