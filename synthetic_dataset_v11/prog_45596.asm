; DESCRIPTION: Draws a red line from (240, 26) to (93, 171).
; PLAN: r0=240(x1), r1=26(y1), r2=93(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 26
LDI r2, 93
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
