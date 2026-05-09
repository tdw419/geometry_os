; DESCRIPTION: Draws a red line from (152, 8) to (151, 248).
; PLAN: r0=152(x1), r1=8(y1), r2=151(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 8
LDI r2, 151
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
