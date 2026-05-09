; DESCRIPTION: Draws a yellow line from (112, 70) to (255, 59).
; PLAN: r0=112(x1), r1=70(y1), r2=255(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 70
LDI r2, 255
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
