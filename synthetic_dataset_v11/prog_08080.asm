; DESCRIPTION: Draws a red line from (237, 59) to (40, 102).
; PLAN: r0=237(x1), r1=59(y1), r2=40(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 59
LDI r2, 40
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
