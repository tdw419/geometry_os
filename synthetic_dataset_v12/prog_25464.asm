; DESCRIPTION: Draws a red line from (144, 22) to (193, 50).
; PLAN: r0=144(x1), r1=22(y1), r2=193(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 22
LDI r2, 193
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
