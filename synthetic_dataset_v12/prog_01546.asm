; DESCRIPTION: Draws a red line from (143, 82) to (148, 168).
; PLAN: r0=143(x1), r1=82(y1), r2=148(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 82
LDI r2, 148
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
