; DESCRIPTION: Draws a red line from (457, 186) to (127, 184).
; PLAN: r0=457(x1), r1=186(y1), r2=127(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 186
LDI r2, 127
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
