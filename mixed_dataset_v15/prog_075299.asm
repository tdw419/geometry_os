; DESCRIPTION: Draws a red line from (223, 38) to (16, 253).
; PLAN: r0=223(x1), r1=38(y1), r2=16(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 38
LDI r2, 16
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
