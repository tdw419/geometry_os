; DESCRIPTION: Draws a red line from (230, 129) to (94, 98).
; PLAN: r0=230(x1), r1=129(y1), r2=94(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 129
LDI r2, 94
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
