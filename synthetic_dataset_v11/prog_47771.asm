; DESCRIPTION: Renders a red line between points (229, 59) and (234, 74).
; PLAN: r0=229(x1), r1=59(y1), r2=234(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 59
LDI r2, 234
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
