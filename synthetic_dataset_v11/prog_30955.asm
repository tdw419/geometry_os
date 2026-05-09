; DESCRIPTION: Draws a green line from (85, 17) to (50, 248).
; PLAN: r0=85(x1), r1=17(y1), r2=50(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 17
LDI r2, 50
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
