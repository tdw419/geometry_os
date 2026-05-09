; DESCRIPTION: Draws a red line from (1, 57) to (176, 68).
; PLAN: r0=1(x1), r1=57(y1), r2=176(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 57
LDI r2, 176
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
