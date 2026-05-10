; DESCRIPTION: Draws a red line from (252, 33) to (373, 59).
; PLAN: r0=252(x1), r1=33(y1), r2=373(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 33
LDI r2, 373
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
