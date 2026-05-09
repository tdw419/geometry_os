; DESCRIPTION: Draws a yellow line from (91, 7) to (59, 133).
; PLAN: r0=91(x1), r1=7(y1), r2=59(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 7
LDI r2, 59
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
