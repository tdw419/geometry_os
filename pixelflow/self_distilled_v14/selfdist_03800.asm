; DESCRIPTION: Draws a red line from (81, 103) to (50, 181).
; PLAN: r0=81(x1), r1=103(y1), r2=50(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 103
LDI r2, 50
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
