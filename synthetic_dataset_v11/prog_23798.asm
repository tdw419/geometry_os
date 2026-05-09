; DESCRIPTION: Draws a red line from (135, 137) to (176, 32).
; PLAN: r0=135(x1), r1=137(y1), r2=176(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 176
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
