; DESCRIPTION: Draws a red line from (211, 255) to (290, 168).
; PLAN: r0=211(x1), r1=255(y1), r2=290(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 255
LDI r2, 290
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
