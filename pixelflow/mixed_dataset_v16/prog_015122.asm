; DESCRIPTION: Draws a yellow line from (43, 205) to (44, 68).
; PLAN: r0=43(x1), r1=205(y1), r2=44(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 205
LDI r2, 44
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
