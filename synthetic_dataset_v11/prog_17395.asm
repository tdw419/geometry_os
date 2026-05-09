; DESCRIPTION: Draws a red line from (144, 54) to (47, 146).
; PLAN: r0=144(x1), r1=54(y1), r2=47(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 54
LDI r2, 47
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
