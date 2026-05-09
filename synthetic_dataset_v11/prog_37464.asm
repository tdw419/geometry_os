; DESCRIPTION: Renders a red line between points (187, 229) and (221, 186).
; PLAN: r0=187(x1), r1=229(y1), r2=221(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 229
LDI r2, 221
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
