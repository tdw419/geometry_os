; DESCRIPTION: Draws a black line from (400, 129) to (158, 164).
; PLAN: r0=400(x1), r1=129(y1), r2=158(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 129
LDI r2, 158
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
