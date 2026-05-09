; DESCRIPTION: Draws a red line from (196, 91) to (218, 194).
; PLAN: r0=196(x1), r1=91(y1), r2=218(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 91
LDI r2, 218
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
