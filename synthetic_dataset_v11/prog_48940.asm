; DESCRIPTION: Draws a red line from (160, 68) to (31, 150).
; PLAN: r0=160(x1), r1=68(y1), r2=31(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 68
LDI r2, 31
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
