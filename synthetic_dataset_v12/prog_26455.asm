; DESCRIPTION: Draws a yellow line from (470, 135) to (187, 116).
; PLAN: r0=470(x1), r1=135(y1), r2=187(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 135
LDI r2, 187
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
