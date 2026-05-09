; DESCRIPTION: Draws a red line from (140, 244) to (71, 26).
; PLAN: r0=140(x1), r1=244(y1), r2=71(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 244
LDI r2, 71
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
