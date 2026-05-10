; DESCRIPTION: Draws a red line from (260, 171) to (299, 46).
; PLAN: r0=260(x1), r1=171(y1), r2=299(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 171
LDI r2, 299
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
