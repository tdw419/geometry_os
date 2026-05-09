; DESCRIPTION: Draws a red line from (415, 82) to (349, 10).
; PLAN: r0=415(x1), r1=82(y1), r2=349(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 82
LDI r2, 349
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
