; DESCRIPTION: Draws a orange line from (237, 47) to (220, 204).
; PLAN: r0=237(x1), r1=47(y1), r2=220(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 47
LDI r2, 220
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
