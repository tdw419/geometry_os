; DESCRIPTION: Draws a green line from (261, 109) to (309, 78).
; PLAN: r0=261(x1), r1=109(y1), r2=309(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 109
LDI r2, 309
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
