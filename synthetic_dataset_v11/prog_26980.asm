; DESCRIPTION: Draws a red line from (153, 244) to (33, 187).
; PLAN: r0=153(x1), r1=244(y1), r2=33(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 244
LDI r2, 33
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
