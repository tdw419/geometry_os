; DESCRIPTION: Draws a red line from (171, 115) to (59, 179).
; PLAN: r0=171(x1), r1=115(y1), r2=59(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 115
LDI r2, 59
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
