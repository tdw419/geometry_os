; DESCRIPTION: Draws a red line from (308, 149) to (187, 241).
; PLAN: r0=308(x1), r1=149(y1), r2=187(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 149
LDI r2, 187
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
