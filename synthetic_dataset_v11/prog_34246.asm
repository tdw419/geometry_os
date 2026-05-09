; DESCRIPTION: Draws a orange line from (204, 248) to (98, 255).
; PLAN: r0=204(x1), r1=248(y1), r2=98(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 248
LDI r2, 98
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
