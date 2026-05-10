; DESCRIPTION: Draws a yellow line from (77, 151) to (59, 95).
; PLAN: r0=77(x1), r1=151(y1), r2=59(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 151
LDI r2, 59
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
