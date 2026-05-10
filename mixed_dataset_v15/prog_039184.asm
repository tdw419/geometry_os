; DESCRIPTION: Draws a red line from (130, 129) to (220, 131).
; PLAN: r0=130(x1), r1=129(y1), r2=220(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 129
LDI r2, 220
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
