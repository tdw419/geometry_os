; DESCRIPTION: Draws a red line from (266, 39) to (196, 65).
; PLAN: r0=266(x1), r1=39(y1), r2=196(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 39
LDI r2, 196
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
