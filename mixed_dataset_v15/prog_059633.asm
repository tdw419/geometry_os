; DESCRIPTION: Renders a red line between points (229, 178) and (387, 205).
; PLAN: r0=229(x1), r1=178(y1), r2=387(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 178
LDI r2, 387
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
