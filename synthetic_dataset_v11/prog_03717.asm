; DESCRIPTION: Draws a red line from (79, 32) to (55, 254).
; PLAN: r0=79(x1), r1=32(y1), r2=55(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 32
LDI r2, 55
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
