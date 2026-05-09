; DESCRIPTION: Draws a red line from (102, 108) to (33, 142).
; PLAN: r0=102(x1), r1=108(y1), r2=33(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 108
LDI r2, 33
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
