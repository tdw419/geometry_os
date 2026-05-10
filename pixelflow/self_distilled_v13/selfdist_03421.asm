; DESCRIPTION: Draws a red line from (33, 143) to (193, 55).
; PLAN: r0=33(x1), r1=143(y1), r2=193(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 143
LDI r2, 193
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
