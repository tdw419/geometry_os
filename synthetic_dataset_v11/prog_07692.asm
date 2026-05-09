; DESCRIPTION: Draws a green line from (82, 205) to (129, 104).
; PLAN: r0=82(x1), r1=205(y1), r2=129(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 205
LDI r2, 129
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
