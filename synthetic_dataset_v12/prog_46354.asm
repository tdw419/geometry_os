; DESCRIPTION: Draws a red line from (89, 91) to (281, 171).
; PLAN: r0=89(x1), r1=91(y1), r2=281(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 91
LDI r2, 281
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
