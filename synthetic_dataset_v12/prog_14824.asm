; DESCRIPTION: Draws a red line from (34, 129) to (260, 229).
; PLAN: r0=34(x1), r1=129(y1), r2=260(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 129
LDI r2, 260
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
