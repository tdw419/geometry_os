; DESCRIPTION: Draws a red line from (106, 129) to (96, 45).
; PLAN: r0=106(x1), r1=129(y1), r2=96(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 129
LDI r2, 96
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
