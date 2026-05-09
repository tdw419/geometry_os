; DESCRIPTION: Draws a cyan line from (205, 155) to (204, 39).
; PLAN: r0=205(x1), r1=155(y1), r2=204(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 155
LDI r2, 204
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
