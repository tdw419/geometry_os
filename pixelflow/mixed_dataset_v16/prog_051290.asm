; DESCRIPTION: Draws a green line from (261, 105) to (406, 204).
; PLAN: r0=261(x1), r1=105(y1), r2=406(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 105
LDI r2, 406
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
