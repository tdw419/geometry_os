; DESCRIPTION: Draws a orange line from (230, 71) to (204, 16).
; PLAN: r0=230(x1), r1=71(y1), r2=204(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 71
LDI r2, 204
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
