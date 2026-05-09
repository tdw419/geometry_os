; DESCRIPTION: Draws a red line from (149, 44) to (148, 48).
; PLAN: r0=149(x1), r1=44(y1), r2=148(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 44
LDI r2, 148
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
