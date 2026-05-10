; DESCRIPTION: Draws a red line from (189, 161) to (304, 91).
; PLAN: r0=189(x1), r1=161(y1), r2=304(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 161
LDI r2, 304
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
