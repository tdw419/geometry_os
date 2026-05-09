; DESCRIPTION: Draws a blue line from (68, 205) to (98, 21).
; PLAN: r0=68(x1), r1=205(y1), r2=98(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 205
LDI r2, 98
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
