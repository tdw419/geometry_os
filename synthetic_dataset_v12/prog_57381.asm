; DESCRIPTION: Draws a red line from (14, 141) to (275, 82).
; PLAN: r0=14(x1), r1=141(y1), r2=275(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 141
LDI r2, 275
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
