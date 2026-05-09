; DESCRIPTION: Draws a orange line from (204, 240) to (87, 29).
; PLAN: r0=204(x1), r1=240(y1), r2=87(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 240
LDI r2, 87
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
